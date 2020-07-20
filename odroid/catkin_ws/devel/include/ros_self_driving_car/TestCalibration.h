// Generated by gencpp from file ros_self_driving_car/TestCalibration.msg
// DO NOT EDIT!


#ifndef ROS_SELF_DRIVING_CAR_MESSAGE_TESTCALIBRATION_H
#define ROS_SELF_DRIVING_CAR_MESSAGE_TESTCALIBRATION_H

#include <ros/service_traits.h>


#include <ros_self_driving_car/TestCalibrationRequest.h>
#include <ros_self_driving_car/TestCalibrationResponse.h>


namespace ros_self_driving_car
{

struct TestCalibration
{

typedef TestCalibrationRequest Request;
typedef TestCalibrationResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct TestCalibration
} // namespace ros_self_driving_car


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::ros_self_driving_car::TestCalibration > {
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::ros_self_driving_car::TestCalibration&) { return value(); }
};

template<>
struct DataType< ::ros_self_driving_car::TestCalibration > {
  static const char* value()
  {
    return "ros_self_driving_car/TestCalibration";
  }

  static const char* value(const ::ros_self_driving_car::TestCalibration&) { return value(); }
};


// service_traits::MD5Sum< ::ros_self_driving_car::TestCalibrationRequest> should match
// service_traits::MD5Sum< ::ros_self_driving_car::TestCalibration >
template<>
struct MD5Sum< ::ros_self_driving_car::TestCalibrationRequest>
{
  static const char* value()
  {
    return MD5Sum< ::ros_self_driving_car::TestCalibration >::value();
  }
  static const char* value(const ::ros_self_driving_car::TestCalibrationRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::ros_self_driving_car::TestCalibrationRequest> should match
// service_traits::DataType< ::ros_self_driving_car::TestCalibration >
template<>
struct DataType< ::ros_self_driving_car::TestCalibrationRequest>
{
  static const char* value()
  {
    return DataType< ::ros_self_driving_car::TestCalibration >::value();
  }
  static const char* value(const ::ros_self_driving_car::TestCalibrationRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::ros_self_driving_car::TestCalibrationResponse> should match
// service_traits::MD5Sum< ::ros_self_driving_car::TestCalibration >
template<>
struct MD5Sum< ::ros_self_driving_car::TestCalibrationResponse>
{
  static const char* value()
  {
    return MD5Sum< ::ros_self_driving_car::TestCalibration >::value();
  }
  static const char* value(const ::ros_self_driving_car::TestCalibrationResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::ros_self_driving_car::TestCalibrationResponse> should match
// service_traits::DataType< ::ros_self_driving_car::TestCalibration >
template<>
struct DataType< ::ros_self_driving_car::TestCalibrationResponse>
{
  static const char* value()
  {
    return DataType< ::ros_self_driving_car::TestCalibration >::value();
  }
  static const char* value(const ::ros_self_driving_car::TestCalibrationResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROS_SELF_DRIVING_CAR_MESSAGE_TESTCALIBRATION_H
