;; Auto-generated. Do not edit!


(when (boundp 'ros_self_driving_car::TestDriversCalibration)
  (if (not (find-package "ROS_SELF_DRIVING_CAR"))
    (make-package "ROS_SELF_DRIVING_CAR"))
  (shadow 'TestDriversCalibration (find-package "ROS_SELF_DRIVING_CAR")))
(unless (find-package "ROS_SELF_DRIVING_CAR::TESTDRIVERSCALIBRATION")
  (make-package "ROS_SELF_DRIVING_CAR::TESTDRIVERSCALIBRATION"))
(unless (find-package "ROS_SELF_DRIVING_CAR::TESTDRIVERSCALIBRATIONREQUEST")
  (make-package "ROS_SELF_DRIVING_CAR::TESTDRIVERSCALIBRATIONREQUEST"))
(unless (find-package "ROS_SELF_DRIVING_CAR::TESTDRIVERSCALIBRATIONRESPONSE")
  (make-package "ROS_SELF_DRIVING_CAR::TESTDRIVERSCALIBRATIONRESPONSE"))

(in-package "ROS")





(defclass ros_self_driving_car::TestDriversCalibrationRequest
  :super ros::object
  :slots ())

(defmethod ros_self_driving_car::TestDriversCalibrationRequest
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

(defclass ros_self_driving_car::TestDriversCalibrationResponse
  :super ros::object
  :slots ())

(defmethod ros_self_driving_car::TestDriversCalibrationResponse
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

(defclass ros_self_driving_car::TestDriversCalibration
  :super ros::object
  :slots ())

(setf (get ros_self_driving_car::TestDriversCalibration :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::TestDriversCalibration :datatype-) "ros_self_driving_car/TestDriversCalibration")
(setf (get ros_self_driving_car::TestDriversCalibration :request) ros_self_driving_car::TestDriversCalibrationRequest)
(setf (get ros_self_driving_car::TestDriversCalibration :response) ros_self_driving_car::TestDriversCalibrationResponse)

(defmethod ros_self_driving_car::TestDriversCalibrationRequest
  (:response () (instance ros_self_driving_car::TestDriversCalibrationResponse :init)))

(setf (get ros_self_driving_car::TestDriversCalibrationRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::TestDriversCalibrationRequest :datatype-) "ros_self_driving_car/TestDriversCalibrationRequest")
(setf (get ros_self_driving_car::TestDriversCalibrationRequest :definition-)
      "
---
")

(setf (get ros_self_driving_car::TestDriversCalibrationResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::TestDriversCalibrationResponse :datatype-) "ros_self_driving_car/TestDriversCalibrationResponse")
(setf (get ros_self_driving_car::TestDriversCalibrationResponse :definition-)
      "
---
")



(provide :ros_self_driving_car/TestDriversCalibration "d41d8cd98f00b204e9800998ecf8427e")


