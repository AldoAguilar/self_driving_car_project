import os
import errno
import serial
import subprocess
from datetime import datetime
import serial.tools.list_ports as port

SENSORS     =   1
ACTUATORS   =   0

BAUD_RATE = 2000000

SOURCES_PATH = os.path.expanduser("~") + "/self_driving_car_project/odroid/src"

CONFIG_PATH = SOURCES_PATH + "/config"
SERIAL_PORT_NAMES_PATH = CONFIG_PATH + "/serial_port_names.txt"

ARDUINO_PROJECT_PATH = SOURCES_PATH +  "/arduino"
SENSORS_CODE_PATH = ARDUINO_PROJECT_PATH + "/sensors"
ACTUATORS_CODE_PATH = ARDUINO_PROJECT_PATH + "/actuators"

ARDUINO_CLI = ARDUINO_PROJECT_PATH + "/arduino-cli"
ARDUINO_CLI_BOARD = " --fqbn arduino:avr:nano:cpu=atmega328old " # Change to ' --fqbn arduino:avr:nano' if non Old Compiler Nano Boards are used
ARDUINO_CLI_COMPILE_CODE = lambda CODE: ARDUINO_CLI + " compile" + ARDUINO_CLI_BOARD + "{code_path}".format(code_path = SENSORS_CODE_PATH if CODE == SENSORS else ACTUATORS_CODE_PATH)
ARDUINO_CLI_UPLOAD_CODE  = lambda CODE, SERIAL_PORT: ARDUINO_CLI + " upload -p" + SERIAL_PORT + ARDUINO_CLI_BOARD + "{code_path}".format(code_path = SENSORS_CODE_PATH if CODE == SENSORS else ACTUATORS_CODE_PATH)

class arduino_code_loader:
    def __init__(self, log_enable = False):
        self.__log_enable = log_enable
        if not os.path.exists(SOURCES_PATH):
            self.__log("ERROR: Self Driving Car Sources Directory was not found!")
            raise IOError(errno.ENOENT, os.strerror(errno.ENOENT), SOURCES_PATH)
        if not os.path.exists(ARDUINO_PROJECT_PATH):
            self.__log("ERROR: Self Driving Car Arduino Project Directory was not found!")
            raise IOError(errno.ENOENT, os.strerror(errno.ENOENT), ARDUINO_PROJECT_PATH)
        if not os.path.exists(SENSORS_CODE_PATH) or not os.path.exists(SENSORS_CODE_PATH + "/sensors.ino"):
            self.__log("ERROR: Self Driving Car Sensors Arduino Code was not found!")
            raise IOError(errno.ENOENT, os.strerror(errno.ENOENT), SENSORS_CODE_PATH + "/sensors.ino")
        if not os.path.exists(ACTUATORS_CODE_PATH) or not os.path.exists(ACTUATORS_CODE_PATH + "/actuators.ino"):
            self.__log("ERROR: Self Driving Car Actuators Arduino Code was not found!")
            raise IOError(errno.ENOENT, os.strerror(errno.ENOENT), ACTUATORS_CODE_PATH + "/actuators.ino")
        if not os.path.exists(ARDUINO_CLI):
            self.__log("ERROR: Self Driving Car Arduino-Cli Binary File was not found!")
            raise IOError(errno.ENOENT, os.strerror(errno.ENOENT), ARDUINO_CLI)
        if not os.path.exists(CONFIG_PATH):
            self.__log("WARNING: Self Driving Car Config Directory was not found, the directory will be created!")
            os.mkdir(CONFIG_PATH)

    def __log(self, log_message):
        if self.__log_enable:
            logger_instance = "arduino_code_loader"
            log_message = str(datetime.now()) + "  :  " + logger_instance + "  :  " + log_message
            print(log_message)

    def __getSerialPortNames(self):
        try:
            self.__log("Trying to get available Serial Ports.")
            portlist = list(port.comports())
            serial_port_names = []
            for p in portlist:
                p = str(p)
                serial_port_names.append(p.split()[0])
            if not len(serial_port_names): raise RuntimeError("No available Serial Ports were found.")
            self.__log("Serial Ports found: " + ", ".join(serial_port_names))
            if len(serial_port_names) == 1: raise RuntimeError("Not enough available Serial Ports were found, two are needed")
            self.__log("Success getting available Serial Ports.")
            return serial_port_names
        except Exception as e:
            self.__log("ERROR: Failed to get available Serial Ports.")
            raise

    def __tryCompileCode(self, CODE):
        code_type_msg = "Sensors" if CODE == SENSORS else "Actuators"
        try:
            self.__log("Trying to Compile " + code_type_msg + " Arduino Code.")
            command = ARDUINO_CLI_COMPILE_CODE(CODE)
            subprocess.check_output(command.split())
            self.__log("Success Compiling " + code_type_msg + " Arduino Code.")
        except Exception as e:
            self.__log("ERROR: Failed to Compile " + code_type_msg + " Arduino Code. (Check that the Arduino-Cli tool has Executable Permissions and that your Arduino Code is correctly written)")
            raise

    def __tryUploadCode(self, CODE, SERIAL_PORT):
        try:
            command = ARDUINO_CLI_UPLOAD_CODE(CODE, SERIAL_PORT)
            subprocess.call(command.split(), stdout = subprocess.PIPE)
            return 1
        except Exception as e:
            return 0

    def __uploadCode(self,CODE, SERIAL_PORT):
        code_type_msg = "Sensors" if CODE == SENSORS else "Actuators"
        self.__log("Trying to Upload " + code_type_msg + " Arduino Code to port " + SERIAL_PORT)
        if self.__tryUploadCode(CODE, SERIAL_PORT):
            upload_debug_value = int(serial.Serial(SERIAL_PORT, BAUD_RATE).readline().decode("utf-8").strip())
            if upload_debug_value != CODE:
                self.__log("Wrong Code Type for selected port, changing Code Type.")
                CODE = SENSORS if CODE == ACTUATORS else ACTUATORS
                return self.__uploadCode(CODE, SERIAL_PORT)
            else:
                self.__log("Success Uploading " + code_type_msg + " Arduino Code.")
                return 1, CODE
        else:
            self.__log("ERROR: Failed to Upload " + code_type_msg + " Arduino Code.")
            return 0, CODE

    def __uploadAllCode(self, serial_port_names):
        SERIAL_PORT_CODE_TYPE_DATA = []
        CODE = SENSORS
        upload_success_count = 0
        while len(serial_port_names) and upload_success_count < 2:
            SERIAL_PORT = serial_port_names.pop(0)
            upload_success, CODE = self.__uploadCode(CODE, SERIAL_PORT)
            if upload_success:
                code_type_msg = "SENSORS" if CODE == SENSORS else "ACTUATORS"
                SERIAL_PORT_CODE_TYPE_DATA.append(code_type_msg + " " + SERIAL_PORT)
                upload_success_count = upload_success_count + 1
            CODE = ACTUATORS if CODE == SENSORS else SENSORS
        if upload_success_count != 2: raise  RuntimeError('Failed to upload Arduino Code.')
        self.__log(", ".join(SERIAL_PORT_CODE_TYPE_DATA))
        return SERIAL_PORT_CODE_TYPE_DATA

    def __tryStoreSerialPortCodeTypeData(self, SERIAL_PORT_CODE_TYPE_DATA):
        try:
            self.__log("Storing Configured Serial Ports Data to '" + SERIAL_PORT_NAMES_PATH + "'.")
            with open(SERIAL_PORT_NAMES_PATH, "w") as f:
                for SERIAL_PORT_CODE_TYPE in SERIAL_PORT_CODE_TYPE_DATA:
                    f.write(SERIAL_PORT_CODE_TYPE + "\r\n")
            self.__log("Success storing Configured Serial Ports Data.")
        except Exception as e:
            self.__log("ERROR: Failed to Store Configured Serial Ports Data")
            raise

    def load_code(self):
        self.__tryCompileCode(SENSORS)
        self.__tryCompileCode(ACTUATORS)
        SERIAL_PORT_CODE_TYPE_DATA = self.__uploadAllCode(self.__getSerialPortNames())
        self.__tryStoreSerialPortCodeTypeData(SERIAL_PORT_CODE_TYPE_DATA)
        return 1
