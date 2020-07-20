// Generated by gencpp from file ros_self_driving_car/LoadArduinoCodeResponse.msg
// DO NOT EDIT!


#ifndef ROS_SELF_DRIVING_CAR_MESSAGE_LOADARDUINOCODERESPONSE_H
#define ROS_SELF_DRIVING_CAR_MESSAGE_LOADARDUINOCODERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ros_self_driving_car
{
template <class ContainerAllocator>
struct LoadArduinoCodeResponse_
{
  typedef LoadArduinoCodeResponse_<ContainerAllocator> Type;

  LoadArduinoCodeResponse_()
    {
    }
  LoadArduinoCodeResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> const> ConstPtr;

}; // struct LoadArduinoCodeResponse_

typedef ::ros_self_driving_car::LoadArduinoCodeResponse_<std::allocator<void> > LoadArduinoCodeResponse;

typedef boost::shared_ptr< ::ros_self_driving_car::LoadArduinoCodeResponse > LoadArduinoCodeResponsePtr;
typedef boost::shared_ptr< ::ros_self_driving_car::LoadArduinoCodeResponse const> LoadArduinoCodeResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace ros_self_driving_car

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_self_driving_car/LoadArduinoCodeResponse";
  }

  static const char* value(const ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LoadArduinoCodeResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::ros_self_driving_car::LoadArduinoCodeResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // ROS_SELF_DRIVING_CAR_MESSAGE_LOADARDUINOCODERESPONSE_H
