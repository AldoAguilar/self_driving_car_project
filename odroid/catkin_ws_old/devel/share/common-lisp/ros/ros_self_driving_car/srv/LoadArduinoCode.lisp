; Auto-generated. Do not edit!


(cl:in-package ros_self_driving_car-srv)


;//! \htmlinclude LoadArduinoCode-request.msg.html

(cl:defclass <LoadArduinoCode-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass LoadArduinoCode-request (<LoadArduinoCode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadArduinoCode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadArduinoCode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-srv:<LoadArduinoCode-request> is deprecated: use ros_self_driving_car-srv:LoadArduinoCode-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadArduinoCode-request>) ostream)
  "Serializes a message object of type '<LoadArduinoCode-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadArduinoCode-request>) istream)
  "Deserializes a message object of type '<LoadArduinoCode-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadArduinoCode-request>)))
  "Returns string type for a service object of type '<LoadArduinoCode-request>"
  "ros_self_driving_car/LoadArduinoCodeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadArduinoCode-request)))
  "Returns string type for a service object of type 'LoadArduinoCode-request"
  "ros_self_driving_car/LoadArduinoCodeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadArduinoCode-request>)))
  "Returns md5sum for a message object of type '<LoadArduinoCode-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadArduinoCode-request)))
  "Returns md5sum for a message object of type 'LoadArduinoCode-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadArduinoCode-request>)))
  "Returns full string definition for message of type '<LoadArduinoCode-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadArduinoCode-request)))
  "Returns full string definition for message of type 'LoadArduinoCode-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadArduinoCode-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadArduinoCode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadArduinoCode-request
))
;//! \htmlinclude LoadArduinoCode-response.msg.html

(cl:defclass <LoadArduinoCode-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass LoadArduinoCode-response (<LoadArduinoCode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadArduinoCode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadArduinoCode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-srv:<LoadArduinoCode-response> is deprecated: use ros_self_driving_car-srv:LoadArduinoCode-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadArduinoCode-response>) ostream)
  "Serializes a message object of type '<LoadArduinoCode-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadArduinoCode-response>) istream)
  "Deserializes a message object of type '<LoadArduinoCode-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadArduinoCode-response>)))
  "Returns string type for a service object of type '<LoadArduinoCode-response>"
  "ros_self_driving_car/LoadArduinoCodeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadArduinoCode-response)))
  "Returns string type for a service object of type 'LoadArduinoCode-response"
  "ros_self_driving_car/LoadArduinoCodeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadArduinoCode-response>)))
  "Returns md5sum for a message object of type '<LoadArduinoCode-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadArduinoCode-response)))
  "Returns md5sum for a message object of type 'LoadArduinoCode-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadArduinoCode-response>)))
  "Returns full string definition for message of type '<LoadArduinoCode-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadArduinoCode-response)))
  "Returns full string definition for message of type 'LoadArduinoCode-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadArduinoCode-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadArduinoCode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadArduinoCode-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LoadArduinoCode)))
  'LoadArduinoCode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LoadArduinoCode)))
  'LoadArduinoCode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadArduinoCode)))
  "Returns string type for a service object of type '<LoadArduinoCode>"
  "ros_self_driving_car/LoadArduinoCode")