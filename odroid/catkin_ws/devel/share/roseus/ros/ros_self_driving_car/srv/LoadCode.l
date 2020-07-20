;; Auto-generated. Do not edit!


(when (boundp 'ros_self_driving_car::LoadCode)
  (if (not (find-package "ROS_SELF_DRIVING_CAR"))
    (make-package "ROS_SELF_DRIVING_CAR"))
  (shadow 'LoadCode (find-package "ROS_SELF_DRIVING_CAR")))
(unless (find-package "ROS_SELF_DRIVING_CAR::LOADCODE")
  (make-package "ROS_SELF_DRIVING_CAR::LOADCODE"))
(unless (find-package "ROS_SELF_DRIVING_CAR::LOADCODEREQUEST")
  (make-package "ROS_SELF_DRIVING_CAR::LOADCODEREQUEST"))
(unless (find-package "ROS_SELF_DRIVING_CAR::LOADCODERESPONSE")
  (make-package "ROS_SELF_DRIVING_CAR::LOADCODERESPONSE"))

(in-package "ROS")





(defclass ros_self_driving_car::LoadCodeRequest
  :super ros::object
  :slots ())

(defmethod ros_self_driving_car::LoadCodeRequest
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

(defclass ros_self_driving_car::LoadCodeResponse
  :super ros::object
  :slots ())

(defmethod ros_self_driving_car::LoadCodeResponse
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

(defclass ros_self_driving_car::LoadCode
  :super ros::object
  :slots ())

(setf (get ros_self_driving_car::LoadCode :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::LoadCode :datatype-) "ros_self_driving_car/LoadCode")
(setf (get ros_self_driving_car::LoadCode :request) ros_self_driving_car::LoadCodeRequest)
(setf (get ros_self_driving_car::LoadCode :response) ros_self_driving_car::LoadCodeResponse)

(defmethod ros_self_driving_car::LoadCodeRequest
  (:response () (instance ros_self_driving_car::LoadCodeResponse :init)))

(setf (get ros_self_driving_car::LoadCodeRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::LoadCodeRequest :datatype-) "ros_self_driving_car/LoadCodeRequest")
(setf (get ros_self_driving_car::LoadCodeRequest :definition-)
      "
---
")

(setf (get ros_self_driving_car::LoadCodeResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_self_driving_car::LoadCodeResponse :datatype-) "ros_self_driving_car/LoadCodeResponse")
(setf (get ros_self_driving_car::LoadCodeResponse :definition-)
      "
---
")



(provide :ros_self_driving_car/LoadCode "d41d8cd98f00b204e9800998ecf8427e")


