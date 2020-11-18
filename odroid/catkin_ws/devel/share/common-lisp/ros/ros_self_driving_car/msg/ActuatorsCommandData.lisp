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
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActuatorsCommandData>) istream)
  "Deserializes a message object of type '<ActuatorsCommandData>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'angle) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
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
  "1562a5a885c295584eaf5e0ababaabd7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActuatorsCommandData)))
  "Returns md5sum for a message object of type 'ActuatorsCommandData"
  "1562a5a885c295584eaf5e0ababaabd7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActuatorsCommandData>)))
  "Returns full string definition for message of type '<ActuatorsCommandData>"
  (cl:format cl:nil "int32 speed~%int32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActuatorsCommandData)))
  "Returns full string definition for message of type 'ActuatorsCommandData"
  (cl:format cl:nil "int32 speed~%int32 angle~%~%~%"))
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
