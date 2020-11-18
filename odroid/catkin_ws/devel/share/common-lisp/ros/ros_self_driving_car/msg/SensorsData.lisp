; Auto-generated. Do not edit!


(cl:in-package ros_self_driving_car-msg)


;//! \htmlinclude SensorsData.msg.html

(cl:defclass <SensorsData> (roslisp-msg-protocol:ros-message)
  ((op_mode
    :reader op_mode
    :initarg :op_mode
    :type cl:string
    :initform "")
   (speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:integer
    :initform 0)
   (motor_cnt
    :reader motor_cnt
    :initarg :motor_cnt
    :type cl:integer
    :initform 0)
   (servo_cnt
    :reader servo_cnt
    :initarg :servo_cnt
    :type cl:integer
    :initform 0)
   (wheel_1_success
    :reader wheel_1_success
    :initarg :wheel_1_success
    :type cl:boolean
    :initform cl:nil)
   (wheel_2_success
    :reader wheel_2_success
    :initarg :wheel_2_success
    :type cl:boolean
    :initform cl:nil)
   (wheel_3_success
    :reader wheel_3_success
    :initarg :wheel_3_success
    :type cl:boolean
    :initform cl:nil)
   (wheel_4_success
    :reader wheel_4_success
    :initarg :wheel_4_success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SensorsData (<SensorsData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SensorsData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SensorsData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-msg:<SensorsData> is deprecated: use ros_self_driving_car-msg:SensorsData instead.")))

(cl:ensure-generic-function 'op_mode-val :lambda-list '(m))
(cl:defmethod op_mode-val ((m <SensorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:op_mode-val is deprecated.  Use ros_self_driving_car-msg:op_mode instead.")
  (op_mode m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <SensorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:speed-val is deprecated.  Use ros_self_driving_car-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <SensorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:angle-val is deprecated.  Use ros_self_driving_car-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'motor_cnt-val :lambda-list '(m))
(cl:defmethod motor_cnt-val ((m <SensorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:motor_cnt-val is deprecated.  Use ros_self_driving_car-msg:motor_cnt instead.")
  (motor_cnt m))

(cl:ensure-generic-function 'servo_cnt-val :lambda-list '(m))
(cl:defmethod servo_cnt-val ((m <SensorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:servo_cnt-val is deprecated.  Use ros_self_driving_car-msg:servo_cnt instead.")
  (servo_cnt m))

(cl:ensure-generic-function 'wheel_1_success-val :lambda-list '(m))
(cl:defmethod wheel_1_success-val ((m <SensorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:wheel_1_success-val is deprecated.  Use ros_self_driving_car-msg:wheel_1_success instead.")
  (wheel_1_success m))

(cl:ensure-generic-function 'wheel_2_success-val :lambda-list '(m))
(cl:defmethod wheel_2_success-val ((m <SensorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:wheel_2_success-val is deprecated.  Use ros_self_driving_car-msg:wheel_2_success instead.")
  (wheel_2_success m))

(cl:ensure-generic-function 'wheel_3_success-val :lambda-list '(m))
(cl:defmethod wheel_3_success-val ((m <SensorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:wheel_3_success-val is deprecated.  Use ros_self_driving_car-msg:wheel_3_success instead.")
  (wheel_3_success m))

(cl:ensure-generic-function 'wheel_4_success-val :lambda-list '(m))
(cl:defmethod wheel_4_success-val ((m <SensorsData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_self_driving_car-msg:wheel_4_success-val is deprecated.  Use ros_self_driving_car-msg:wheel_4_success instead.")
  (wheel_4_success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SensorsData>) ostream)
  "Serializes a message object of type '<SensorsData>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'op_mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'op_mode))
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'motor_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'motor_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'motor_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'servo_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'servo_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'servo_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'servo_cnt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wheel_1_success) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wheel_2_success) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wheel_3_success) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wheel_4_success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SensorsData>) istream)
  "Deserializes a message object of type '<SensorsData>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'op_mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'op_mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'motor_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'motor_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'motor_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'servo_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'servo_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'servo_cnt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'servo_cnt)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel_1_success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'wheel_2_success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'wheel_3_success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'wheel_4_success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SensorsData>)))
  "Returns string type for a message object of type '<SensorsData>"
  "ros_self_driving_car/SensorsData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SensorsData)))
  "Returns string type for a message object of type 'SensorsData"
  "ros_self_driving_car/SensorsData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SensorsData>)))
  "Returns md5sum for a message object of type '<SensorsData>"
  "ca5a2621c8a00e6fea801ce1abd88ec5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SensorsData)))
  "Returns md5sum for a message object of type 'SensorsData"
  "ca5a2621c8a00e6fea801ce1abd88ec5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SensorsData>)))
  "Returns full string definition for message of type '<SensorsData>"
  (cl:format cl:nil "string op_mode~%int32 speed~%int32 angle~%uint32 motor_cnt~%uint32 servo_cnt~%bool wheel_1_success~%bool wheel_2_success~%bool wheel_3_success~%bool wheel_4_success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SensorsData)))
  "Returns full string definition for message of type 'SensorsData"
  (cl:format cl:nil "string op_mode~%int32 speed~%int32 angle~%uint32 motor_cnt~%uint32 servo_cnt~%bool wheel_1_success~%bool wheel_2_success~%bool wheel_3_success~%bool wheel_4_success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SensorsData>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'op_mode))
     4
     4
     4
     4
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SensorsData>))
  "Converts a ROS message object to a list"
  (cl:list 'SensorsData
    (cl:cons ':op_mode (op_mode msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':motor_cnt (motor_cnt msg))
    (cl:cons ':servo_cnt (servo_cnt msg))
    (cl:cons ':wheel_1_success (wheel_1_success msg))
    (cl:cons ':wheel_2_success (wheel_2_success msg))
    (cl:cons ':wheel_3_success (wheel_3_success msg))
    (cl:cons ':wheel_4_success (wheel_4_success msg))
))
