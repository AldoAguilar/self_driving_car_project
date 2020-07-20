#!/usr/bin/env python
import rospy
import os
import errno
import time
import serial
from datetime import datetime
from arduino_code_loader import arduino_code_loader
from drivers.sensors_driver import sensors_driver
from drivers.actuators_driver import actuators_driver

SOURCES_PATH = os.path.expanduser("~") + "/self_driving_car_project/odroid/src"

ARDUINO_PROJECT_PATH = SOURCES_PATH +  "/arduino"
ACTUATORS_CODE_PATH = ARDUINO_PROJECT_PATH + "/actuators/actuators.ino"

CALIBRATION_TIME = 5
TEST_CONST = 11;

class motor_calibrator:
    def __init__(self, log_enable = False):
        self.__log_enable = log_enable
        if not os.path.exists(SOURCES_PATH):
            self.__log("ERROR: Self Driving Car Sources Directory was not found!")
            raise IOError(errno.ENOENT, os.strerror(errno.ENOENT), SOURCES_PATH)

        self.__actuators_driver = actuators_driver(self.__log_enable)
        self.__sensors_driver = sensors_driver(self.__log_enable)

    def __log(self, log_message):
        if self.__log_enable:
            logger_instance = "motor_calibrator   "
            log_message = str(datetime.now()) + "  :  " + logger_instance + "  :  " + log_message
            print(log_message)

    def __getMotorsMeanCount(self):
        self.__log("Press enter to continue...")
        while raw_input() != "": pass
        self.__log("Calibrating for " + str(CALIBRATION_TIME) + " seconds...")
        MEAN_SERVO_CNT = 0
        MEAN_MOTOR_CNT = 0
        START_TIME = time.time()
        ELAPSED_TIME = 0
        CNT = 0
        while ELAPSED_TIME <= CALIBRATION_TIME :
            ELAPSED_TIME = time.time() - START_TIME
            SENSORED_DATA = self.__sensors_driver.getSensoredData()
            MEAN_SERVO_CNT = MEAN_SERVO_CNT + SENSORED_DATA.servo_cnt
            MEAN_MOTOR_CNT = MEAN_MOTOR_CNT + SENSORED_DATA.motor_cnt
            CNT = CNT + 1
        MEAN_SERVO_CNT = round(MEAN_SERVO_CNT / CNT)
        MEAN_MOTOR_CNT = round(MEAN_MOTOR_CNT / CNT)

        return int(MEAN_MOTOR_CNT), int(MEAN_SERVO_CNT)

    def __validateInitialConditions(self, test = False):
        self.__log("Validating correct RF Pairing and Manual Operation Mode.")
        SENSORED_DATA = self.__sensors_driver.getSensoredData()
        if SENSORED_DATA.op_mode == 'A' or SENSORED_DATA.motor_cnt == 0 or SENSORED_DATA.servo_cnt == 0: self.__log("ERROR: Pair the RF Control with the vehicle and set Manual Mode. (Are both the vehicle and the RF Control ON? If so, check that the RF Control is correctly connected)")
        while SENSORED_DATA.op_mode == 'A' or SENSORED_DATA.motor_cnt == 0 or SENSORED_DATA.servo_cnt == 0: SENSORED_DATA = self.__sensors_driver.getSensoredData()
        self.__log("Correct RF Pairing and Manual Operation Mode.")
        self.__log("WARNING: Do not turn off your RF Controller!")
        if test:
            SENSORED_DATA = self.__sensors_driver.getSensoredData()
            if SENSORED_DATA.op_mode != 'A': self.__log("ERROR: Set the Operation Mode to Autonomous.")
            while SENSORED_DATA.op_mode != 'A': SENSORED_DATA = self.__sensors_driver.getSensoredData()

    def calibrate(self):
        self.__log("Sarting callibration process.")
        self.__validateInitialConditions()

        self.__log("WARNING: Do not move any stick on your RF Control.")
        MOTOR_IDLE_CNT, SERVO_IDLE_CNT = self.__getMotorsMeanCount()

        self.__log("Success Calibrating Motors.")
        self.__log("MOTOR_IDLE_CNT = " + str(MOTOR_IDLE_CNT))
        self.__log("SERVO_IDLE_CNT = " + str(SERVO_IDLE_CNT))

        self.__log("WARNING: Set and hold the vehicle to the minimum expected speed until the calibration is finished.")
        MOTOR_MIN_CNT, _ = self.__getMotorsMeanCount()

        self.__log("Success Calibrating Motors.")
        self.__log("MOTOR_MIN_CNT = " + str(MOTOR_MIN_CNT))

        self.__log("WARNING: Set and hold the vehicle directional motor to the maximum right expected position until the calibration is finished.")
        _, SERVO_RIGHT_CNT = self.__getMotorsMeanCount()

        self.__log("Success Calibrating Motors.")
        self.__log("SERVO_RIGHT_CNT = " + str(SERVO_RIGHT_CNT))

        self.__log("WARNING: Set and hold the vehicle directional motor to the maximum left expected position until the calibration is finished.")
        _, SERVO_LEFT_CNT = self.__getMotorsMeanCount()

        self.__log("Success Calibrating Motors.")
        self.__log("SERVO_LEFT_CNT = " + str(SERVO_LEFT_CNT))

        self.__tryStoreCalibrationData(MOTOR_IDLE_CNT, SERVO_IDLE_CNT, MOTOR_MIN_CNT, SERVO_RIGHT_CNT, SERVO_LEFT_CNT)

    def __tryStoreCalibrationData(self, MOTOR_IDLE_CNT, SERVO_IDLE_CNT, MOTOR_MIN_CNT, SERVO_RIGHT_CNT, SERVO_LEFT_CNT):
        try:
            SERVO_MIN_CNT = min([SERVO_RIGHT_CNT, SERVO_LEFT_CNT])
            SERVO_MAX_CNT = max([SERVO_RIGHT_CNT, SERVO_LEFT_CNT])

            self.__log("Storing Configured Callibration Values to '" + ACTUATORS_CODE_PATH + "'.")
            with open(ACTUATORS_CODE_PATH , "r") as f: lines = f.readlines()
            cnt = 0
            for id in range(len(lines)):
                if cnt == 5: break
                line = lines[id].split()
                if all(word in line  for word in "const unsigned int MOTOR_IDLE_CNT".split()):
                    lines[id] = "const unsigned int MOTOR_IDLE_CNT = " + str(MOTOR_IDLE_CNT) +";\n"
                    cnt = cnt + 1
                elif all(word in line  for word in "const unsigned int SERVO_IDLE_CNT".split()):
                    lines[id] = "const unsigned int SERVO_IDLE_CNT = " + str(SERVO_IDLE_CNT) +";\n"
                    cnt = cnt + 1
                elif all(word in line  for word in "const unsigned int MOTOR_MIN_CNT".split()):
                    lines[id] = "const unsigned int MOTOR_MIN_CNT  = " + str(MOTOR_MIN_CNT) +";\n"
                    cnt = cnt + 1
                elif all(word in line  for word in "const unsigned int SERVO_MIN_CNT".split()):
                    lines[id] = "const unsigned int SERVO_MIN_CNT  = " + str(SERVO_MIN_CNT) +";\n"
                    cnt = cnt + 1
                elif all(word in line  for word in "const unsigned int SERVO_MAX_CNT".split()):
                    lines[id] = "const unsigned int SERVO_MAX_CNT  = " + str(SERVO_MAX_CNT) +";\n"
                    cnt = cnt + 1

            with open(ACTUATORS_CODE_PATH, "w") as f:
                for line in lines:
                    f.write(line)
            self.__log("Success storing Configured Callibration Values.")

            self.__log("Loading calibrated values.")
            code_loader = arduino_code_loader(log_enable = self.__log_enable)
            code_loader.load_code()
        except Exception as e:
            self.__log("ERROR: Failed to Store Configured Callibration Values")
            raise

    def test(self):
        self.__validateInitialConditions(test = True)
        self.__log("Starting callibration testing process.")
        self.__actuators_driver.sendCommandData(TEST_CONST, TEST_CONST)
        self.__log("Success running callibration testing process.")
