;; Auto-generated. Do not edit!


(when (boundp 'ros_self_driving_car::ActuatorsData)
  (if (not (find-package "ROS_SELF_DRIVING_CAR"))
    (make-package "ROS_SELF_DRIVING_CAR"))
  (shadow 'ActuatorsData (find-package "ROS_SELF_DRIVING_CAR")))
(unless (find-package "ROS_SELF_DRIVING_CAR::ACTUATORSDATA")
  (make-package "ROS_SELF_DRIVING_CAR::ACTUATORSDATA"))

(in-package "ROS")
;;//! \htmlinclude ActuatorsData.msg.html


(defclass ros_self_driving_car::ActuatorsData
  :super ros::object
  :slots (_motor_cnt _servo_cnt ))

(defmethod ros_self_driving_car::ActuatorsData
  (:init
   (&key
    ((:motor_cnt __motor_cnt) 0)
    ((:servo_cnt __servo_cnt) 0)
    )
   (send-super :init)
   (setq _motor_cnt (round __motor_cnt))
   (setq _servo_cnt (round __servo_cnt))
   self)
  (:motor_cnt
   (&optional __motor_cnt)
   (if __motor_cnt (setq _motor_cnt __motor_cnt)) _motor_cnt)
  (:servo_cnt
   (&optional __servo_cnt)
   (if __servo_cnt (setq _servo_cnt __servo_cnt)) _servo_cnt)
  (:serialization-length
   ()
   (+
    ;; uint32 _motor_cnt
    4
    ;; uint32 _servo_cnt
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _motor_cnt
       (write-long _motor_cnt s)
     ;; uint32 _servo_cnt
       (write-long _servo_cnt s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _motor_cnt
     (setq _motor_cnt (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _servo_cnt
     (setq _servo_cnt (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_self_driving_car::ActuatorsData :md5sum-) "6b6ed50629e9328ed4596da02266d79d")
(setf (get ros_self_driving_car::ActuatorsData :datatype-) "ros_self_driving_car/ActuatorsData")
(setf (get ros_self_driving_car::ActuatorsData :definition-)
      "uint32 motor_cnt
uint32 servo_cnt

")



(provide :ros_self_driving_car/ActuatorsData "6b6ed50629e9328ed4596da02266d79d")


