#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from ros_self_driving_car.msg import SensorsData
from ros_self_driving_car.msg import ActuatorsData
from libraries.drivers.sensors_driver import sensors_driver
from libraries.drivers.actuators_driver import actuators_driver

sensors_driver_delay_ms = 0.0
actuators_driver_delay_ms = 0.0

ros_rate_times_per_sec = 10

def actuators_callback(actuators_data):
    actuators_driver.sendCommandData(actuators_data.speed, actuators_data.angle)

def self_driving_car_node(sensors_driver, actuators_driver):
    sensors_topic = rospy.Publisher('sensors_data', SensorsData, queue_size = 1000)
    rospy.init_node('self_driving_car_node', anonymous = True)
    rospy.Subscriber('actuators_data', ActuatorsData, actuators_callback)

    rate = rospy.Rate(ros_rate_times_per_sec);

    while not rospy.is_shutdown():
        sensored_data = sensors_driver.getSensoredData()
        if not sensored_data: continue
        sensors_topic.publish(sensored_data)
        rate.sleep()

if __name__ == '__main__':
    try:
        # load_arduino_code()

        sensors_driver = sensors_driver(log_enable = True, driver_delay = sensors_driver_delay_ms / 1000)
        actuators_driver = actuators_driver(log_enable = True, driver_delay = actuators_driver_delay_ms / 1000)
        self_driving_car_node(sensors_driver, actuators_driver)

    except rospy.ROSInterruptException:
        pass
