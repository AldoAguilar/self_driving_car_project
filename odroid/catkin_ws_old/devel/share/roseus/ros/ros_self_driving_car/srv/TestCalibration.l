;; Auto-generated. Do not edit!


(when (boundp 'ros_self_driving_car::TestCalibration)
  (if (not (find-package "ROS_SELF_DRIVING_CAR"))
    (make-package "ROS_SELF_DRIVING_CAR"))
  (shadow 'TestCalibration (find-package "ROS_SELF_DRIVING_CAR")))
(unless (find-package "ROS_SELF_DRIVING_CAR::TESTCALIBRATION")
  (make-package "ROS_SELF_DRIVING_CAR::TESTCALIBRATION"))
(unless (find-package "ROS_SELF_DRIVING_CAR::TESTCALIBRATIONREQUEST")
  (make-package "ROS_SELF_DRIVING_CAR::TESTCALIBRATIONREQUEST"))
(unless (find-package "ROS_SELF_DRIVING_CAR::TESTCALIBRATIONRESPONSE")
  (make-package "ROS_SELF_DRIVING_CAR::TESTCALIBRATIONRESPONSE"))

(in-package "ROS")





(defclass ros_self_driving_car::TestCalibrationRequest
  :super ros::object
  :slots ())

(defmethod ros_self_driving_car::TestCalibrationRequest
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

(defclass ros_self_driving_car::TestCalibrationResponse
  :super ros::object
  :slots ())

(defmethod ros_self_driving_car::TestCalibrationResponse
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

(defclass ros_self_driving_car::TestCalibration
  :super ros::object
  :slots ())

(setf (get ros_self_driving_car::TestCalibration :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::TestCalibration :datatype-) "ros_self_driving_car/TestCalibration")
(setf (get ros_self_driving_car::TestCalibration :request) ros_self_driving_car::TestCalibrationRequest)
(setf (get ros_self_driving_car::TestCalibration :response) ros_self_driving_car::TestCalibrationResponse)

(defmethod ros_self_driving_car::TestCalibrationRequest
  (:response () (instance ros_self_driving_car::TestCalibrationResponse :init)))

(setf (get ros_self_driving_car::TestCalibrationRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::TestCalibrationRequest :datatype-) "ros_self_driving_car/TestCalibrationRequest")
(setf (get ros_self_driving_car::TestCalibrationRequest :definition-)
      "
---
")

(setf (get ros_self_driving_car::TestCalibrationResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::TestCalibrationResponse :datatype-) "ros_self_driving_car/TestCalibrationResponse")
(setf (get ros_self_driving_car::TestCalibrationResponse :definition-)
      "
---
")



(provide :ros_self_driving_car/TestCalibration "d41d8cd98f00b204e9800998ecf8427e")


