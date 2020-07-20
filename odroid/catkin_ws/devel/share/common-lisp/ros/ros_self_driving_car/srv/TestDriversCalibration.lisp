; Auto-generated. Do not edit!


(cl:in-package ros_self_driving_car-srv)


;//! \htmlinclude TestDriversCalibration-request.msg.html

(cl:defclass <TestDriversCalibration-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass TestDriversCalibration-request (<TestDriversCalibration-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TestDriversCalibration-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TestDriversCalibration-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-srv:<TestDriversCalibration-request> is deprecated: use ros_self_driving_car-srv:TestDriversCalibration-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TestDriversCalibration-request>) ostream)
  "Serializes a message object of type '<TestDriversCalibration-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TestDriversCalibration-request>) istream)
  "Deserializes a message object of type '<TestDriversCalibration-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TestDriversCalibration-request>)))
  "Returns string type for a service object of type '<TestDriversCalibration-request>"
  "ros_self_driving_car/TestDriversCalibrationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TestDriversCalibration-request)))
  "Returns string type for a service object of type 'TestDriversCalibration-request"
  "ros_self_driving_car/TestDriversCalibrationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TestDriversCalibration-request>)))
  "Returns md5sum for a message object of type '<TestDriversCalibration-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TestDriversCalibration-request)))
  "Returns md5sum for a message object of type 'TestDriversCalibration-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TestDriversCalibration-request>)))
  "Returns full string definition for message of type '<TestDriversCalibration-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TestDriversCalibration-request)))
  "Returns full string definition for message of type 'TestDriversCalibration-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TestDriversCalibration-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TestDriversCalibration-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TestDriversCalibration-request
))
;//! \htmlinclude TestDriversCalibration-response.msg.html

(cl:defclass <TestDriversCalibration-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass TestDriversCalibration-response (<TestDriversCalibration-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TestDriversCalibration-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TestDriversCalibration-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_self_driving_car-srv:<TestDriversCalibration-response> is deprecated: use ros_self_driving_car-srv:TestDriversCalibration-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TestDriversCalibration-response>) ostream)
  "Serializes a message object of type '<TestDriversCalibration-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TestDriversCalibration-response>) istream)
  "Deserializes a message object of type '<TestDriversCalibration-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TestDriversCalibration-response>)))
  "Returns string type for a service object of type '<TestDriversCalibration-response>"
  "ros_self_driving_car/TestDriversCalibrationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TestDriversCalibration-response)))
  "Returns string type for a service object of type 'TestDriversCalibration-response"
  "ros_self_driving_car/TestDriversCalibrationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TestDriversCalibration-response>)))
  "Returns md5sum for a message object of type '<TestDriversCalibration-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TestDriversCalibration-response)))
  "Returns md5sum for a message object of type 'TestDriversCalibration-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TestDriversCalibration-response>)))
  "Returns full string definition for message of type '<TestDriversCalibration-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TestDriversCalibration-response)))
  "Returns full string definition for message of type 'TestDriversCalibration-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TestDriversCalibration-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TestDriversCalibration-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TestDriversCalibration-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TestDriversCalibration)))
  'TestDriversCalibration-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TestDriversCalibration)))
  'TestDriversCalibration-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TestDriversCalibration)))
  "Returns string type for a service object of type '<TestDriversCalibration>"
  "ros_self_driving_car/TestDriversCalibration")