#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from ros_self_driving_car.msg import SensorsData
from ros_self_driving_car.msg import ActuatorsData
from ros_self_driving_car.msg import ActuatorsCommandData
from libraries.drivers.sensors_driver import sensors_driver
from libraries.drivers.actuators_driver import actuators_driver

sensors_driver_delay_ms = 0.0
actuators_driver_delay_ms = 0.0

ros_rate_times_per_sec = 10

def actuators_callback(actuators_command_data):
    actuators_driver.sendCommandData(actuators_command_data.speed, actuators_command_data.angle)

def self_driving_car_node(sensors_driver, actuators_driver):
    sensors_topic = rospy.Publisher('sensors_data', SensorsData, queue_size = 1000)
    actuators_topic = rospy.Publisher('actuators_data', ActuatorsData, queue_size = 1000)

    rospy.init_node('self_driving_car_node', anonymous = True)
    rospy.Subscriber('actuators_command_data', ActuatorsCommandData, actuators_callback)

    rate = rospy.Rate(ros_rate_times_per_sec);

    while not rospy.is_shutdown():
        sensored_data = sensors_driver.getSensoredData()
        if not sensored_data: continue
        sensors_topic.publish(sensored_data)
        actuators_data = actuators_driver.getActuatorsData()
        if not actuators_data: continue
        actuators_topic.publish(actuators_data)
        rate.sleep()

if __name__ == '__main__':
    try:
        sensors_driver = sensors_driver(log_enable = True, driver_delay = sensors_driver_delay_ms / 1000)
        actuators_driver = actuators_driver(log_enable = True, driver_delay = actuators_driver_delay_ms / 1000)
        self_driving_car_node(sensors_driver, actuators_driver)

    except rospy.ROSInterruptException:
        pass
