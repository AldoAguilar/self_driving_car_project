; Auto-generated. Do not edit!


(cl:in-package ros_self_driving_car-msg)


;//! \htmlinclude ActuatorsData.msg.html

(cl:defclass <ActuatorsData> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:integer
    :initform 0))
)

(cl:defclass ActuatorsData (<ActuatorsData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActuatorsData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActuatorsData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-msg:<ActuatorsData> is deprecated: use ros_self_driving_car-msg:ActuatorsData instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ActuatorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:speed-val is deprecated.  Use ros_self_driving_car-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <ActuatorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:angle-val is deprecated.  Use ros_self_driving_car-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActuatorsData>) ostream)
  "Serializes a message object of type '<ActuatorsData>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'angle)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActuatorsData>) istream)
  "Deserializes a message object of type '<ActuatorsData>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'angle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'angle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'angle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'angle)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActuatorsData>)))
  "Returns string type for a message object of type '<ActuatorsData>"
  "ros_self_driving_car/ActuatorsData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActuatorsData)))
  "Returns string type for a message object of type 'ActuatorsData"
  "ros_self_driving_car/ActuatorsData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActuatorsData>)))
  "Returns md5sum for a message object of type '<ActuatorsData>"
  "9caa6924c81cdc9852d0edbb4d6db3f1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActuatorsData)))
  "Returns md5sum for a message object of type 'ActuatorsData"
  "9caa6924c81cdc9852d0edbb4d6db3f1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActuatorsData>)))
  "Returns full string definition for message of type '<ActuatorsData>"
  (cl:format cl:nil "uint32 speed~%uint32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActuatorsData)))
  "Returns full string definition for message of type 'ActuatorsData"
  (cl:format cl:nil "uint32 speed~%uint32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActuatorsData>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActuatorsData>))
  "Converts a ROS message object to a list"
  (cl:list 'ActuatorsData
    (cl:cons ':speed (speed msg))
    (cl:cons ':angle (angle msg))
))
