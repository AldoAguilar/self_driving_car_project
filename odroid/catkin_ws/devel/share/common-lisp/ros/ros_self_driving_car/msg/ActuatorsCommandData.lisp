; Auto-generated. Do not edit!


(cl:in-package ros_self_driving_car-msg)


;//! \htmlinclude ActuatorsCommandData.msg.html

(cl:defclass <ActuatorsCommandData> (roslisp-msg-protocol:ros-message)
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

(cl:defclass ActuatorsCommandData (<ActuatorsCommandData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActuatorsCommandData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActuatorsCommandData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-msg:<ActuatorsCommandData> is deprecated: use ros_self_driving_car-msg:ActuatorsCommandData instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ActuatorsCommandData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:speed-val is deprecated.  Use ros_self_driving_car-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <ActuatorsCommandData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:angle-val is deprecated.  Use ros_self_driving_car-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActuatorsCommandData>) ostream)
  "Serializes a message object of type '<ActuatorsCommandData>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'angle)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActuatorsCommandData>) istream)
  "Deserializes a message object of type '<ActuatorsCommandData>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActuatorsCommandData>)))
  "Returns string type for a message object of type '<ActuatorsCommandData>"
  "ros_self_driving_car/ActuatorsCommandData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActuatorsCommandData)))
  "Returns string type for a message object of type 'ActuatorsCommandData"
  "ros_self_driving_car/ActuatorsCommandData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActuatorsCommandData>)))
  "Returns md5sum for a message object of type '<ActuatorsCommandData>"
  "9caa6924c81cdc9852d0edbb4d6db3f1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActuatorsCommandData)))
  "Returns md5sum for a message object of type 'ActuatorsCommandData"
  "9caa6924c81cdc9852d0edbb4d6db3f1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActuatorsCommandData>)))
  "Returns full string definition for message of type '<ActuatorsCommandData>"
  (cl:format cl:nil "uint32 speed~%uint32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActuatorsCommandData)))
  "Returns full string definition for message of type 'ActuatorsCommandData"
  (cl:format cl:nil "uint32 speed~%uint32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActuatorsCommandData>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActuatorsCommandData>))
  "Converts a ROS message object to a list"
  (cl:list 'ActuatorsCommandData
    (cl:cons ':speed (speed msg))
    (cl:cons ':angle (angle msg))
))
