;; Auto-generated. Do not edit!


(when (boundp 'ros_self_driving_car::SensorsData)
  (if (not (find-package "ROS_SELF_DRIVING_CAR"))
    (make-package "ROS_SELF_DRIVING_CAR"))
  (shadow 'SensorsData (find-package "ROS_SELF_DRIVING_CAR")))
(unless (find-package "ROS_SELF_DRIVING_CAR::SENSORSDATA")
  (make-package "ROS_SELF_DRIVING_CAR::SENSORSDATA"))

(in-package "ROS")
;;//! \htmlinclude SensorsData.msg.html


(defclass ros_self_driving_car::SensorsData
  :super ros::object
  :slots (_op_mode _speed _angle _motor_cnt _servo_cnt ))

(defmethod ros_self_driving_car::SensorsData
  (:init
   (&key
    ((:op_mode __op_mode) "")
    ((:speed __speed) 0)
    ((:angle __angle) 0)
    ((:motor_cnt __motor_cnt) 0)
    ((:servo_cnt __servo_cnt) 0)
    )
   (send-super :init)
   (setq _op_mode (string __op_mode))
   (setq _speed (round __speed))
   (setq _angle (round __angle))
   (setq _motor_cnt (round __motor_cnt))
   (setq _servo_cnt (round __servo_cnt))
   self)
  (:op_mode
   (&optional __op_mode)
   (if __op_mode (setq _op_mode __op_mode)) _op_mode)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:motor_cnt
   (&optional __motor_cnt)
   (if __motor_cnt (setq _motor_cnt __motor_cnt)) _motor_cnt)
  (:servo_cnt
   (&optional __servo_cnt)
   (if __servo_cnt (setq _servo_cnt __servo_cnt)) _servo_cnt)
  (:serialization-length
   ()
   (+
    ;; string _op_mode
    4 (length _op_mode)
    ;; uint32 _speed
    4
    ;; uint32 _angle
    4
    ;; uint32 _motor_cnt
    4
    ;; uint32 _servo_cnt
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _op_mode
       (write-long (length _op_mode) s) (princ _op_mode s)
     ;; uint32 _speed
       (write-long _speed s)
     ;; uint32 _angle
       (write-long _angle s)
     ;; uint32 _motor_cnt
       (write-long _motor_cnt s)
     ;; uint32 _servo_cnt
       (write-long _servo_cnt s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _op_mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _op_mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _speed
     (setq _speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _angle
     (setq _angle (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _motor_cnt
     (setq _motor_cnt (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _servo_cnt
     (setq _servo_cnt (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_self_driving_car::SensorsData :md5sum-) "f03b55dfb7ed838621525bc6021ad49d")
(setf (get ros_self_driving_car::SensorsData :datatype-) "ros_self_driving_car/SensorsData")
(setf (get ros_self_driving_car::SensorsData :definition-)
      "string op_mode
uint32 speed
uint32 angle
uint32 motor_cnt
uint32 servo_cnt

")



(provide :ros_self_driving_car/SensorsData "f03b55dfb7ed838621525bc6021ad49d")


