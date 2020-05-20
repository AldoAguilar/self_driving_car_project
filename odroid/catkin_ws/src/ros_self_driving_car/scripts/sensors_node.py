#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from ros_self_driving_car.msg import SensorsData
from libraries.drivers.sensors_driver import sensors_driver

def sensors_node():
    driver = sensors_driver(log_enable = True, driver_delay = 0.0, validate = False)
    pub = rospy.Publisher('sensors_data', SensorsData, queue_size = 100)
    rospy.init_node('sensors_node', anonymous = True)
    rate = rospy.Rate(10)
    sensored_data = SensorsData()
    while not rospy.is_shutdown():
        sensored_data = driver.getSensoredData()
        if not sensored_data: continue
        sensored_data_str = "OP MODE: " + sensored_data.op_mode + ", SPEED: " + str(sensored_data.speed) + ", ANGLE: " + str(sensored_data.angle) + ", MOTOR_CNT: " + str(sensored_data.motor_cnt) + ", SERVO_CNT: " + str(sensored_data.servo_cnt) + "."
        rospy.loginfo(sensored_data_str)
        pub.publish(sensored_data)
        rate.sleep()

if __name__ == '__main__':
    try:
        sensors_node()
    except rospy.ROSInterruptException:
        pass
