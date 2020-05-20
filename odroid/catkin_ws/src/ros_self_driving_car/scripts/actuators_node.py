#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from ros_self_driving_car.msg import ActuatorsData
from libraries.drivers.actuators_driver import actuators_driver

driver = actuators_driver(log_enable = True, driver_delay = 0, validate = False)

def callback(data):
    driver.sendCommandData(data.speed, data.angle)
    rospy.loginfo("SPEED = %s, ANGLE = %s" % (data.speed, data.angle))

def actuators_node():
    rospy.init_node('actuators_node', anonymous = True)
    rospy.Subscriber('actuators_data', ActuatorsData, callback)
    rospy.spin()

if __name__ == '__main__':
    actuators_node()
