// Generated by gencpp from file ros_self_driving_car/TestDriversCalibration.msg
// DO NOT EDIT!


#ifndef ROS_SELF_DRIVING_CAR_MESSAGE_TESTDRIVERSCALIBRATION_H
#define ROS_SELF_DRIVING_CAR_MESSAGE_TESTDRIVERSCALIBRATION_H

#include <ros/service_traits.h>


#include <ros_self_driving_car/TestDriversCalibrationRequest.h>
#include <ros_self_driving_car/TestDriversCalibrationResponse.h>


namespace ros_self_driving_car
{

struct TestDriversCalibration
{

typedef TestDriversCalibrationRequest Request;
typedef TestDriversCalibrationResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct TestDriversCalibration
} // namespace ros_self_driving_car


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::ros_self_driving_car::TestDriversCalibration > {
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::ros_self_driving_car::TestDriversCalibration&) { return value(); }
};

template<>
struct DataType< ::ros_self_driving_car::TestDriversCalibration > {
  static const char* value()
  {
    return "ros_self_driving_car/TestDriversCalibration";
  }

  static const char* value(const ::ros_self_driving_car::TestDriversCalibration&) { return value(); }
};


// service_traits::MD5Sum< ::ros_self_driving_car::TestDriversCalibrationRequest> should match
// service_traits::MD5Sum< ::ros_self_driving_car::TestDriversCalibration >
template<>
struct MD5Sum< ::ros_self_driving_car::TestDriversCalibrationRequest>
{
  static const char* value()
  {
    return MD5Sum< ::ros_self_driving_car::TestDriversCalibration >::value();
  }
  static const char* value(const ::ros_self_driving_car::TestDriversCalibrationRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::ros_self_driving_car::TestDriversCalibrationRequest> should match
// service_traits::DataType< ::ros_self_driving_car::TestDriversCalibration >
template<>
struct DataType< ::ros_self_driving_car::TestDriversCalibrationRequest>
{
  static const char* value()
  {
    return DataType< ::ros_self_driving_car::TestDriversCalibration >::value();
  }
  static const char* value(const ::ros_self_driving_car::TestDriversCalibrationRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::ros_self_driving_car::TestDriversCalibrationResponse> should match
// service_traits::MD5Sum< ::ros_self_driving_car::TestDriversCalibration >
template<>
struct MD5Sum< ::ros_self_driving_car::TestDriversCalibrationResponse>
{
  static const char* value()
  {
    return MD5Sum< ::ros_self_driving_car::TestDriversCalibration >::value();
  }
  static const char* value(const ::ros_self_driving_car::TestDriversCalibrationResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::ros_self_driving_car::TestDriversCalibrationResponse> should match
// service_traits::DataType< ::ros_self_driving_car::TestDriversCalibration >
template<>
struct DataType< ::ros_self_driving_car::TestDriversCalibrationResponse>
{
  static const char* value()
  {
    return DataType< ::ros_self_driving_car::TestDriversCalibration >::value();
  }
  static const char* value(const ::ros_self_driving_car::TestDriversCalibrationResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROS_SELF_DRIVING_CAR_MESSAGE_TESTDRIVERSCALIBRATION_H
