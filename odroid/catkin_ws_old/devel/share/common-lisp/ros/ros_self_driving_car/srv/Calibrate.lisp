; Auto-generated. Do not edit!


(cl:in-package ros_self_driving_car-srv)


;//! \htmlinclude Calibrate-request.msg.html

(cl:defclass <Calibrate-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Calibrate-request (<Calibrate-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Calibrate-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Calibrate-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-srv:<Calibrate-request> is deprecated: use ros_self_driving_car-srv:Calibrate-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Calibrate-request>) ostream)
  "Serializes a message object of type '<Calibrate-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Calibrate-request>) istream)
  "Deserializes a message object of type '<Calibrate-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Calibrate-request>)))
  "Returns string type for a service object of type '<Calibrate-request>"
  "ros_self_driving_car/CalibrateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Calibrate-request)))
  "Returns string type for a service object of type 'Calibrate-request"
  "ros_self_driving_car/CalibrateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Calibrate-request>)))
  "Returns md5sum for a message object of type '<Calibrate-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Calibrate-request)))
  "Returns md5sum for a message object of type 'Calibrate-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Calibrate-request>)))
  "Returns full string definition for message of type '<Calibrate-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Calibrate-request)))
  "Returns full string definition for message of type 'Calibrate-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Calibrate-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Calibrate-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Calibrate-request
))
;//! \htmlinclude Calibrate-response.msg.html

(cl:defclass <Calibrate-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Calibrate-response (<Calibrate-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Calibrate-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Calibrate-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-srv:<Calibrate-response> is deprecated: use ros_self_driving_car-srv:Calibrate-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Calibrate-response>) ostream)
  "Serializes a message object of type '<Calibrate-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Calibrate-response>) istream)
  "Deserializes a message object of type '<Calibrate-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Calibrate-response>)))
  "Returns string type for a service object of type '<Calibrate-response>"
  "ros_self_driving_car/CalibrateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Calibrate-response)))
  "Returns string type for a service object of type 'Calibrate-response"
  "ros_self_driving_car/CalibrateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Calibrate-response>)))
  "Returns md5sum for a message object of type '<Calibrate-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Calibrate-response)))
  "Returns md5sum for a message object of type 'Calibrate-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Calibrate-response>)))
  "Returns full string definition for message of type '<Calibrate-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Calibrate-response)))
  "Returns full string definition for message of type 'Calibrate-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Calibrate-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Calibrate-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Calibrate-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Calibrate)))
  'Calibrate-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Calibrate)))
  'Calibrate-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Calibrate)))
  "Returns string type for a service object of type '<Calibrate>"
  "ros_self_driving_car/Calibrate")