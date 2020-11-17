import os
import errno
import time
import serial
from datetime import datetime
from ros_self_driving_car.msg import SensorsData

BAUD_RATE = 2000000

SENSORS_DEBUG_VALUE = 1

SOURCES_PATH = os.path.expanduser("~") + "/self_driving_car_project/odroid/src"

CONFIG_PATH = SOURCES_PATH + "/config"
SERIAL_PORT_NAMES_PATH = CONFIG_PATH + "/serial_port_names.txt"

READ_CMD_MSG = "GET\r\n"

class sensors_driver:
    def __init__(self, log_enable = False, driver_delay = 0.05, serial_port = None):
        self.__log_enable = log_enable
        if not os.path.exists(SOURCES_PATH):
            self.__log("ERROR: Self Driving Car Sources Directory was not found!")
            raise IOError(errno.ENOENT, os.strerror(errno.ENOENT), SOURCES_PATH)
        if not os.path.exists(CONFIG_PATH) and serial_port is None:
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
        if self.__serial_port is None: self.__tryGetSensorsSerialPortName()
        self.__trySetSerialConnection()
        # self.__validateCodeType()

    def __log(self, log_message):
        if self.__log_enable:
            logger_instance = "sensors_driver     "
            log_message = str(datetime.now()) + "  :  " + logger_instance + "  :  " + log_message
            print(log_message)

    def __tryGetSensorsSerialPortName(self):
        try:
            self.__log("Trying to get Sensors Serial Port Name from Config Files.")
            with open(SERIAL_PORT_NAMES_PATH) as f: lines = f.readlines()
            for line in lines:
                line = line.strip()
                line_content = line.split(" ")
                if line_content[0] == "SENSORS": self.__serial_port = line_content[1]
            self.__log("Success getting Sensors Serial Port Name: " + self.__serial_port)
        except Exception as e:
            self.__log("ERROR: Failed to get Sensors Serial Port Name. (Missing '" + SERIAL_PORT_NAMES_PATH + "' file?)")
            raise

    def __trySetSerialConnection(self):
        try:
            self.__log("Trying to establish Serial Connection using Port " + self.__serial_port + ".")
            self.__serial = serial.Serial(self.__serial_port, BAUD_RATE)
            self.__log("Sucess establishing Serial Connection.")
        except Exception as e:
            self.__log("ERROR: Failed to establish Serial Connection.")
            raise

    # def __validateCodeType(self):
    #     self.__log("Verifying Correct Code Type for selected port.")
    #     upload_debug_value = int(self.__serial.readline().decode("utf-8").strip())
    #     if upload_debug_value != SENSORS_DEBUG_VALUE:
    #         self.__log("ERROR: Wrong Code Type for selected port. (Check that the configured Serial Port for the Sensors driver is correct!)")
    #         raise RuntimeError('Wrong Code Type for selected port ' + self.__serial_port)
    #     self.__log("Success validating Code Type for selected port.")

    def getSensoredData(self):
        try:
            sensored_data_dict = dict()
            time.sleep(self.__driver_delay)
            self.__serial.write(str.encode(READ_CMD_MSG))
            sensored_data = self.__serial.readline().decode('ascii').strip().split()
            sensored_data_msg = 0
            if len(sensored_data) != 1:
                sensored_data_msg = SensorsData()
                sensored_data_msg.op_mode = str(sensored_data[0])
                sensored_data_msg.speed = int(sensored_data[1])
                sensored_data_msg.angle = int(sensored_data[2])
                sensored_data_msg.motor_cnt = int(sensored_data[3])
                sensored_data_msg.servo_cnt = int(sensored_data[4])
                sensored_data_msg.wheel_1_success = bool(int(sensored_data[5]))
                sensored_data_msg.wheel_2_success = bool(int(sensored_data[6]))
                sensored_data_msg.wheel_3_success = bool(int(sensored_data[7]))
                sensored_data_msg.wheel_4_success = bool(int(sensored_data[8]))
            return sensored_data_msg
        except Exception as e:
            self.__log("ERROR: Failed to get sensored data.")
            raise
