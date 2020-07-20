; Auto-generated. Do not edit!


(cl:in-package ros_self_driving_car-srv)


;//! \htmlinclude LoadCode-request.msg.html

(cl:defclass <LoadCode-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass LoadCode-request (<LoadCode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadCode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadCode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-srv:<LoadCode-request> is deprecated: use ros_self_driving_car-srv:LoadCode-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadCode-request>) ostream)
  "Serializes a message object of type '<LoadCode-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadCode-request>) istream)
  "Deserializes a message object of type '<LoadCode-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadCode-request>)))
  "Returns string type for a service object of type '<LoadCode-request>"
  "ros_self_driving_car/LoadCodeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadCode-request)))
  "Returns string type for a service object of type 'LoadCode-request"
  "ros_self_driving_car/LoadCodeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadCode-request>)))
  "Returns md5sum for a message object of type '<LoadCode-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadCode-request)))
  "Returns md5sum for a message object of type 'LoadCode-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadCode-request>)))
  "Returns full string definition for message of type '<LoadCode-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadCode-request)))
  "Returns full string definition for message of type 'LoadCode-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadCode-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadCode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadCode-request
))
;//! \htmlinclude LoadCode-response.msg.html

(cl:defclass <LoadCode-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass LoadCode-response (<LoadCode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadCode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadCode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-srv:<LoadCode-response> is deprecated: use ros_self_driving_car-srv:LoadCode-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadCode-response>) ostream)
  "Serializes a message object of type '<LoadCode-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadCode-response>) istream)
  "Deserializes a message object of type '<LoadCode-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadCode-response>)))
  "Returns string type for a service object of type '<LoadCode-response>"
  "ros_self_driving_car/LoadCodeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadCode-response)))
  "Returns string type for a service object of type 'LoadCode-response"
  "ros_self_driving_car/LoadCodeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadCode-response>)))
  "Returns md5sum for a message object of type '<LoadCode-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadCode-response)))
  "Returns md5sum for a message object of type 'LoadCode-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadCode-response>)))
  "Returns full string definition for message of type '<LoadCode-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadCode-response)))
  "Returns full string definition for message of type 'LoadCode-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadCode-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadCode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadCode-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LoadCode)))
  'LoadCode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LoadCode)))
  'LoadCode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadCode)))
  "Returns string type for a service object of type '<LoadCode>"
  "ros_self_driving_car/LoadCode")