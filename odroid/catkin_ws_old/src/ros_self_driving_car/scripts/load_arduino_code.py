#!/usr/bin/env python
import rospy
from libraries.arduino_code_loader import arduino_code_loader

if __name__ == '__main__':
    try:
        code_loader = arduino_code_loader(log_enable = True)
        code_loader.load_code()
    except rospy.ROSInterruptException as e:
        print(e)
