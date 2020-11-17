;; Auto-generated. Do not edit!


(when (boundp 'ros_self_driving_car::LoadArduinoCode)
  (if (not (find-package "ROS_SELF_DRIVING_CAR"))
    (make-package "ROS_SELF_DRIVING_CAR"))
  (shadow 'LoadArduinoCode (find-package "ROS_SELF_DRIVING_CAR")))
(unless (find-package "ROS_SELF_DRIVING_CAR::LOADARDUINOCODE")
  (make-package "ROS_SELF_DRIVING_CAR::LOADARDUINOCODE"))
(unless (find-package "ROS_SELF_DRIVING_CAR::LOADARDUINOCODEREQUEST")
  (make-package "ROS_SELF_DRIVING_CAR::LOADARDUINOCODEREQUEST"))
(unless (find-package "ROS_SELF_DRIVING_CAR::LOADARDUINOCODERESPONSE")
  (make-package "ROS_SELF_DRIVING_CAR::LOADARDUINOCODERESPONSE"))

(in-package "ROS")





(defclass ros_self_driving_car::LoadArduinoCodeRequest
  :super ros::object
  :slots ())

(defmethod ros_self_driving_car::LoadArduinoCodeRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass ros_self_driving_car::LoadArduinoCodeResponse
  :super ros::object
  :slots ())

(defmethod ros_self_driving_car::LoadArduinoCodeResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass ros_self_driving_car::LoadArduinoCode
  :super ros::object
  :slots ())

(setf (get ros_self_driving_car::LoadArduinoCode :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::LoadArduinoCode :datatype-) "ros_self_driving_car/LoadArduinoCode")
(setf (get ros_self_driving_car::LoadArduinoCode :request) ros_self_driving_car::LoadArduinoCodeRequest)
(setf (get ros_self_driving_car::LoadArduinoCode :response) ros_self_driving_car::LoadArduinoCodeResponse)

(defmethod ros_self_driving_car::LoadArduinoCodeRequest
  (:response () (instance ros_self_driving_car::LoadArduinoCodeResponse :init)))

(setf (get ros_self_driving_car::LoadArduinoCodeRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::LoadArduinoCodeRequest :datatype-) "ros_self_driving_car/LoadArduinoCodeRequest")
(setf (get ros_self_driving_car::LoadArduinoCodeRequest :definition-)
      "
---
")

(setf (get ros_self_driving_car::LoadArduinoCodeResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::LoadArduinoCodeResponse :datatype-) "ros_self_driving_car/LoadArduinoCodeResponse")
(setf (get ros_self_driving_car::LoadArduinoCodeResponse :definition-)
      "
---
")



(provide :ros_self_driving_car/LoadArduinoCode "d41d8cd98f00b204e9800998ecf8427e")


