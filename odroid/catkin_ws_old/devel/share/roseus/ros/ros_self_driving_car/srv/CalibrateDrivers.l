;; Auto-generated. Do not edit!


(when (boundp 'ros_self_driving_car::CalibrateDrivers)
  (if (not (find-package "ROS_SELF_DRIVING_CAR"))
    (make-package "ROS_SELF_DRIVING_CAR"))
  (shadow 'CalibrateDrivers (find-package "ROS_SELF_DRIVING_CAR")))
(unless (find-package "ROS_SELF_DRIVING_CAR::CALIBRATEDRIVERS")
  (make-package "ROS_SELF_DRIVING_CAR::CALIBRATEDRIVERS"))
(unless (find-package "ROS_SELF_DRIVING_CAR::CALIBRATEDRIVERSREQUEST")
  (make-package "ROS_SELF_DRIVING_CAR::CALIBRATEDRIVERSREQUEST"))
(unless (find-package "ROS_SELF_DRIVING_CAR::CALIBRATEDRIVERSRESPONSE")
  (make-package "ROS_SELF_DRIVING_CAR::CALIBRATEDRIVERSRESPONSE"))

(in-package "ROS")





(defclass ros_self_driving_car::CalibrateDriversRequest
  :super ros::object
  :slots ())

(defmethod ros_self_driving_car::CalibrateDriversRequest
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

(defclass ros_self_driving_car::CalibrateDriversResponse
  :super ros::object
  :slots ())

(defmethod ros_self_driving_car::CalibrateDriversResponse
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

(defclass ros_self_driving_car::CalibrateDrivers
  :super ros::object
  :slots ())

(setf (get ros_self_driving_car::CalibrateDrivers :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::CalibrateDrivers :datatype-) "ros_self_driving_car/CalibrateDrivers")
(setf (get ros_self_driving_car::CalibrateDrivers :request) ros_self_driving_car::CalibrateDriversRequest)
(setf (get ros_self_driving_car::CalibrateDrivers :response) ros_self_driving_car::CalibrateDriversResponse)

(defmethod ros_self_driving_car::CalibrateDriversRequest
  (:response () (instance ros_self_driving_car::CalibrateDriversResponse :init)))

(setf (get ros_self_driving_car::CalibrateDriversRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::CalibrateDriversRequest :datatype-) "ros_self_driving_car/CalibrateDriversRequest")
(setf (get ros_self_driving_car::CalibrateDriversRequest :definition-)
      "
---
")

(setf (get ros_self_driving_car::CalibrateDriversResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::CalibrateDriversResponse :datatype-) "ros_self_driving_car/CalibrateDriversResponse")
(setf (get ros_self_driving_car::CalibrateDriversResponse :definition-)
      "
---
")



(provide :ros_self_driving_car/CalibrateDrivers "d41d8cd98f00b204e9800998ecf8427e")


