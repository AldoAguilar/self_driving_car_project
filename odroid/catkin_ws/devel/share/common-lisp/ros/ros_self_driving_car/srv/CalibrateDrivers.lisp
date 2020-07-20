; Auto-generated. Do not edit!


(cl:in-package ros_self_driving_car-srv)


;//! \htmlinclude CalibrateDrivers-request.msg.html

(cl:defclass <CalibrateDrivers-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CalibrateDrivers-request (<CalibrateDrivers-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CalibrateDrivers-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CalibrateDrivers-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-srv:<CalibrateDrivers-request> is deprecated: use ros_self_driving_car-srv:CalibrateDrivers-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CalibrateDrivers-request>) ostream)
  "Serializes a message object of type '<CalibrateDrivers-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CalibrateDrivers-request>) istream)
  "Deserializes a message object of type '<CalibrateDrivers-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CalibrateDrivers-request>)))
  "Returns string type for a service object of type '<CalibrateDrivers-request>"
  "ros_self_driving_car/CalibrateDriversRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CalibrateDrivers-request)))
  "Returns string type for a service object of type 'CalibrateDrivers-request"
  "ros_self_driving_car/CalibrateDriversRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CalibrateDrivers-request>)))
  "Returns md5sum for a message object of type '<CalibrateDrivers-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CalibrateDrivers-request)))
  "Returns md5sum for a message object of type 'CalibrateDrivers-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CalibrateDrivers-request>)))
  "Returns full string definition for message of type '<CalibrateDrivers-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CalibrateDrivers-request)))
  "Returns full string definition for message of type 'CalibrateDrivers-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CalibrateDrivers-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CalibrateDrivers-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CalibrateDrivers-request
))
;//! \htmlinclude CalibrateDrivers-response.msg.html

(cl:defclass <CalibrateDrivers-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CalibrateDrivers-response (<CalibrateDrivers-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CalibrateDrivers-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CalibrateDrivers-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-srv:<CalibrateDrivers-response> is deprecated: use ros_self_driving_car-srv:CalibrateDrivers-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CalibrateDrivers-response>) ostream)
  "Serializes a message object of type '<CalibrateDrivers-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CalibrateDrivers-response>) istream)
  "Deserializes a message object of type '<CalibrateDrivers-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CalibrateDrivers-response>)))
  "Returns string type for a service object of type '<CalibrateDrivers-response>"
  "ros_self_driving_car/CalibrateDriversResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CalibrateDrivers-response)))
  "Returns string type for a service object of type 'CalibrateDrivers-response"
  "ros_self_driving_car/CalibrateDriversResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CalibrateDrivers-response>)))
  "Returns md5sum for a message object of type '<CalibrateDrivers-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CalibrateDrivers-response)))
  "Returns md5sum for a message object of type 'CalibrateDrivers-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CalibrateDrivers-response>)))
  "Returns full string definition for message of type '<CalibrateDrivers-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CalibrateDrivers-response)))
  "Returns full string definition for message of type 'CalibrateDrivers-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CalibrateDrivers-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CalibrateDrivers-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CalibrateDrivers-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CalibrateDrivers)))
  'CalibrateDrivers-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CalibrateDrivers)))
  'CalibrateDrivers-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CalibrateDrivers)))
  "Returns string type for a service object of type '<CalibrateDrivers>"
  "ros_self_driving_car/CalibrateDrivers")