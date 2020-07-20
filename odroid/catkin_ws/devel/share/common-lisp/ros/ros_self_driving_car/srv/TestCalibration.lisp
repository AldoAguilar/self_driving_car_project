; Auto-generated. Do not edit!


(cl:in-package ros_self_driving_car-srv)


;//! \htmlinclude TestCalibration-request.msg.html

(cl:defclass <TestCalibration-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass TestCalibration-request (<TestCalibration-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TestCalibration-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TestCalibration-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-srv:<TestCalibration-request> is deprecated: use ros_self_driving_car-srv:TestCalibration-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TestCalibration-request>) ostream)
  "Serializes a message object of type '<TestCalibration-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TestCalibration-request>) istream)
  "Deserializes a message object of type '<TestCalibration-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TestCalibration-request>)))
  "Returns string type for a service object of type '<TestCalibration-request>"
  "ros_self_driving_car/TestCalibrationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TestCalibration-request)))
  "Returns string type for a service object of type 'TestCalibration-request"
  "ros_self_driving_car/TestCalibrationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TestCalibration-request>)))
  "Returns md5sum for a message object of type '<TestCalibration-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TestCalibration-request)))
  "Returns md5sum for a message object of type 'TestCalibration-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TestCalibration-request>)))
  "Returns full string definition for message of type '<TestCalibration-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TestCalibration-request)))
  "Returns full string definition for message of type 'TestCalibration-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TestCalibration-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TestCalibration-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TestCalibration-request
))
;//! \htmlinclude TestCalibration-response.msg.html

(cl:defclass <TestCalibration-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass TestCalibration-response (<TestCalibration-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TestCalibration-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TestCalibration-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-srv:<TestCalibration-response> is deprecated: use ros_self_driving_car-srv:TestCalibration-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TestCalibration-response>) ostream)
  "Serializes a message object of type '<TestCalibration-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TestCalibration-response>) istream)
  "Deserializes a message object of type '<TestCalibration-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TestCalibration-response>)))
  "Returns string type for a service object of type '<TestCalibration-response>"
  "ros_self_driving_car/TestCalibrationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TestCalibration-response)))
  "Returns string type for a service object of type 'TestCalibration-response"
  "ros_self_driving_car/TestCalibrationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TestCalibration-response>)))
  "Returns md5sum for a message object of type '<TestCalibration-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TestCalibration-response)))
  "Returns md5sum for a message object of type 'TestCalibration-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TestCalibration-response>)))
  "Returns full string definition for message of type '<TestCalibration-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TestCalibration-response)))
  "Returns full string definition for message of type 'TestCalibration-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TestCalibration-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TestCalibration-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TestCalibration-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TestCalibration)))
  'TestCalibration-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TestCalibration)))
  'TestCalibration-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TestCalibration)))
  "Returns string type for a service object of type '<TestCalibration>"
  "ros_self_driving_car/TestCalibration")