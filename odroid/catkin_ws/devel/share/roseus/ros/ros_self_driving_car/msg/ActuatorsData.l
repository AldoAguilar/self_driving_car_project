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
  :slots (_speed _angle ))

(defmethod ros_self_driving_car::ActuatorsData
  (:init
   (&key
    ((:speed __speed) 0)
    ((:angle __angle) 0)
    )
   (send-super :init)
   (setq _speed (round __speed))
   (setq _angle (round __angle))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; uint32 _speed
    4
    ;; uint32 _angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _speed
       (write-long _speed s)
     ;; uint32 _angle
       (write-long _angle s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _speed
     (setq _speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _angle
     (setq _angle (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_self_driving_car::ActuatorsData :md5sum-) "9caa6924c81cdc9852d0edbb4d6db3f1")
(setf (get ros_self_driving_car::ActuatorsData :datatype-) "ros_self_driving_car/ActuatorsData")
(setf (get ros_self_driving_car::ActuatorsData :definition-)
      "uint32 speed
uint32 angle

")



(provide :ros_self_driving_car/ActuatorsData "9caa6924c81cdc9852d0edbb4d6db3f1")


