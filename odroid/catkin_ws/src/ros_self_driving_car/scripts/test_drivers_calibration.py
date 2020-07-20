#!/usr/bin/env python
import rospy
from libraries.motor_calibrator import motor_calibrator

if __name__ == '__main__':
    try:
        calibrator = motor_calibrator(log_enable = True)
        calibrator.test()
    except rospy.ROSInterruptException as e:
        print(e)
        pass
