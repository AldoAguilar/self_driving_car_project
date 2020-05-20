import os
import errno
import time
import serial
from datetime import datetime
from ros_self_driving_car.msg import ActuatorsData

BAUD_RATE = 2000000

ACTUATOR_DEBUG_VALUE = 0

SOURCES_PATH = os.path.expanduser("~") + "/self_driving_car_project/odroid/src"

CONFIG_PATH = SOURCES_PATH + "/config"
SERIAL_PORT_NAMES_PATH = CONFIG_PATH + "/serial_port_names.txt"

class actuators_driver:
    def __init__(self, log_enable = False, driver_delay = 0.05, serial_port = None):
        self.__log_enable = log_enable

        if not os.path.exists(SOURCES_PATH):
            self.__log("ERROR: Self Driving Car Sources Directory was not found!")
            raise IOError(errno.ENOENT, os.strerror(errno.ENOENT), SOURCES_PATH)
        if not os.path.exists(CONFIG_PATH):
            self.__log("ERROR: Self Driving Car Config Directory was not found!")
            raise IOError(errno.ENOENT, os.strerror(errno.ENOENT), CONFIG_PATH)
        if not os.path.exists(SERIAL_PORT_NAMES_PATH) and serial_port is None:
            self.__log("ERROR: Self Driving Car Serial Port Names Config File was not found!")
            raise IOError(errno.ENOENT, os.strerror(errno.ENOENT), SERIAL_PORT_NAMES_PATH)

        self.__driver_delay = driver_delay

        self.__serial_port = serial_port
        self.__serial = None

        self.__init()

    def __init(self):
        if self.__serial_port is None: self.__tryGetActuatorsSerialPortName()
        self.__trySetSerialConnection()
        self.__validateCodeType()

    def __log(self, log_message):
        if self.__log_enable:
            logger_instance = "actuators_driver   "
            log_message = str(datetime.now()) + "  :  " + logger_instance + "  :  " + log_message
            print(log_message)

    def __tryGetActuatorsSerialPortName(self):
        try:
            self.__log("Trying to get Actuators Serial Port Name from Config Files.")
            with open(SERIAL_PORT_NAMES_PATH) as f: lines = f.readlines()
            for line in lines:
                line = line.strip()
                line_content = line.split(" ")
                if line_content[0] == "ACTUATORS": self.__serial_port = line_content[1]
            self.__log("Success getting Actuators Serial Port Name: " + self.__serial_port)
        except Exception as e:
            self.__log("ERROR: Failed to get Actuators Serial Port Name. (Missing '" + SERIAL_PORT_NAMES_PATH + "' file?)")
            raise

    def __trySetSerialConnection(self):
        try:
            self.__log("Trying to establish Serial Connection using Port " + self.__serial_port + ".")
            self.__serial = serial.Serial(self.__serial_port, BAUD_RATE)
            self.__log("Sucess establishing Serial Connection.")
        except Exception as e:
            self.__log("ERROR: Failed to establish Serial Connection.")
            raise

    def __validateCodeType(self):
        self.__log("Verifying Correct Code Type for selected port.")
        upload_debug_value = int(self.__serial.readline().decode("utf-8").strip())
        if upload_debug_value != ACTUATOR_DEBUG_VALUE:
            self.__log("ERROR: Wrong Code Type for selected port. (Check that the configured Serial Port for the Actuators driver is correct!)")
            raise RuntimeError('Wrong Code Type for selected port ' + self.__serial_port)
        self.__log("Success validating Code Type for selected port.")

    def sendCommandData(self, speed, angle):
        try:
            cmd_result_data_dict = dict()
            time.sleep(self.__driver_delay)
            self.__serial.write(str.encode(str(speed) + " " + str(angle) + "\r\n"))
            cmd_result_data = self.__serial.readline().decode('unicode-escape').strip().split()
            actuators_data_msg = 0
            if len(cmd_result_data) != 1:
                actuators_data_msg = ActuatorsData()
                actuators_data_msg.speed = int(cmd_result_data[0])
                actuators_data_msg.angle = int(cmd_result_data[1])
            return actuators_data_msg
        except Exception as e:
            self.__log("ERROR: Failed to send command data (SPEED: " + speed + ", ANGLE: "  + angle + ").")
            raise
