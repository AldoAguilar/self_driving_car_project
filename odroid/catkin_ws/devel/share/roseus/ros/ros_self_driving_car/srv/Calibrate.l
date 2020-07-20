;; Auto-generated. Do not edit!


(when (boundp 'ros_self_driving_car::Calibrate)
  (if (not (find-package "ROS_SELF_DRIVING_CAR"))
    (make-package "ROS_SELF_DRIVING_CAR"))
  (shadow 'Calibrate (find-package "ROS_SELF_DRIVING_CAR")))
(unless (find-package "ROS_SELF_DRIVING_CAR::CALIBRATE")
  (make-package "ROS_SELF_DRIVING_CAR::CALIBRATE"))
(unless (find-package "ROS_SELF_DRIVING_CAR::CALIBRATEREQUEST")
  (make-package "ROS_SELF_DRIVING_CAR::CALIBRATEREQUEST"))
(unless (find-package "ROS_SELF_DRIVING_CAR::CALIBRATERESPONSE")
  (make-package "ROS_SELF_DRIVING_CAR::CALIBRATERESPONSE"))

(in-package "ROS")





(defclass ros_self_driving_car::CalibrateRequest
  :super ros::object
  :slots ())

(defmethod ros_self_driving_car::CalibrateRequest
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

(defclass ros_self_driving_car::CalibrateResponse
  :super ros::object
  :slots ())

(defmethod ros_self_driving_car::CalibrateResponse
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

(defclass ros_self_driving_car::Calibrate
  :super ros::object
  :slots ())

(setf (get ros_self_driving_car::Calibrate :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::Calibrate :datatype-) "ros_self_driving_car/Calibrate")
(setf (get ros_self_driving_car::Calibrate :request) ros_self_driving_car::CalibrateRequest)
(setf (get ros_self_driving_car::Calibrate :response) ros_self_driving_car::CalibrateResponse)

(defmethod ros_self_driving_car::CalibrateRequest
  (:response () (instance ros_self_driving_car::CalibrateResponse :init)))

(setf (get ros_self_driving_car::CalibrateRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::CalibrateRequest :datatype-) "ros_self_driving_car/CalibrateRequest")
(setf (get ros_self_driving_car::CalibrateRequest :definition-)
      "
---
")

(setf (get ros_self_driving_car::CalibrateResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::CalibrateResponse :datatype-) "ros_self_driving_car/CalibrateResponse")
(setf (get ros_self_driving_car::CalibrateResponse :definition-)
      "
---
")



(provide :ros_self_driving_car/Calibrate "d41d8cd98f00b204e9800998ecf8427e")


