; Auto-generated. Do not edit!


(cl:in-package ros_self_driving_car-msg)


;//! \htmlinclude ActuatorsData.msg.html

(cl:defclass <ActuatorsData> (roslisp-msg-protocol:ros-message)
  ((motor_cnt
    :reader motor_cnt
    :initarg :motor_cnt
    :type cl:integer
    :initform 0)
   (servo_cnt
    :reader servo_cnt
    :initarg :servo_cnt
    :type cl:integer
    :initform 0))
)

(cl:defclass ActuatorsData (<ActuatorsData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActuatorsData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActuatorsData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-msg:<ActuatorsData> is deprecated: use ros_self_driving_car-msg:ActuatorsData instead.")))

(cl:ensure-generic-function 'motor_cnt-val :lambda-list '(m))
(cl:defmethod motor_cnt-val ((m <ActuatorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:motor_cnt-val is deprecated.  Use ros_self_driving_car-msg:motor_cnt instead.")
  (motor_cnt m))

(cl:ensure-generic-function 'servo_cnt-val :lambda-list '(m))
(cl:defmethod servo_cnt-val ((m <ActuatorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:servo_cnt-val is deprecated.  Use ros_self_driving_car-msg:servo_cnt instead.")
  (servo_cnt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActuatorsData>) ostream)
  "Serializes a message object of type '<ActuatorsData>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'motor_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'motor_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'motor_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'servo_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'servo_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'servo_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'servo_cnt)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActuatorsData>) istream)
  "Deserializes a message object of type '<ActuatorsData>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'motor_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'motor_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'motor_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'servo_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'servo_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'servo_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'servo_cnt)) (cl:read-byte istream))
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
  "6b6ed50629e9328ed4596da02266d79d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActuatorsData)))
  "Returns md5sum for a message object of type 'ActuatorsData"
  "6b6ed50629e9328ed4596da02266d79d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActuatorsData>)))
  "Returns full string definition for message of type '<ActuatorsData>"
  (cl:format cl:nil "uint32 motor_cnt~%uint32 servo_cnt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActuatorsData)))
  "Returns full string definition for message of type 'ActuatorsData"
  (cl:format cl:nil "uint32 motor_cnt~%uint32 servo_cnt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActuatorsData>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActuatorsData>))
  "Converts a ROS message object to a list"
  (cl:list 'ActuatorsData
    (cl:cons ':motor_cnt (motor_cnt msg))
    (cl:cons ':servo_cnt (servo_cnt msg))
))
