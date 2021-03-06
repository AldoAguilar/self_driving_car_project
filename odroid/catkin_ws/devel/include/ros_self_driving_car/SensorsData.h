// Generated by gencpp from file ros_self_driving_car/SensorsData.msg
// DO NOT EDIT!


#ifndef ROS_SELF_DRIVING_CAR_MESSAGE_SENSORSDATA_H
#define ROS_SELF_DRIVING_CAR_MESSAGE_SENSORSDATA_H


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
struct SensorsData_
{
  typedef SensorsData_<ContainerAllocator> Type;

  SensorsData_()
    : op_mode()
    , speed(0)
    , angle(0)
    , motor_cnt(0)
    , servo_cnt(0)
    , wheel_1_success(false)
    , wheel_2_success(false)
    , wheel_3_success(false)
    , wheel_4_success(false)  {
    }
  SensorsData_(const ContainerAllocator& _alloc)
    : op_mode(_alloc)
    , speed(0)
    , angle(0)
    , motor_cnt(0)
    , servo_cnt(0)
    , wheel_1_success(false)
    , wheel_2_success(false)
    , wheel_3_success(false)
    , wheel_4_success(false)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _op_mode_type;
  _op_mode_type op_mode;

   typedef int32_t _speed_type;
  _speed_type speed;

   typedef int32_t _angle_type;
  _angle_type angle;

   typedef uint32_t _motor_cnt_type;
  _motor_cnt_type motor_cnt;

   typedef uint32_t _servo_cnt_type;
  _servo_cnt_type servo_cnt;

   typedef uint8_t _wheel_1_success_type;
  _wheel_1_success_type wheel_1_success;

   typedef uint8_t _wheel_2_success_type;
  _wheel_2_success_type wheel_2_success;

   typedef uint8_t _wheel_3_success_type;
  _wheel_3_success_type wheel_3_success;

   typedef uint8_t _wheel_4_success_type;
  _wheel_4_success_type wheel_4_success;





  typedef boost::shared_ptr< ::ros_self_driving_car::SensorsData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_self_driving_car::SensorsData_<ContainerAllocator> const> ConstPtr;

}; // struct SensorsData_

typedef ::ros_self_driving_car::SensorsData_<std::allocator<void> > SensorsData;

typedef boost::shared_ptr< ::ros_self_driving_car::SensorsData > SensorsDataPtr;
typedef boost::shared_ptr< ::ros_self_driving_car::SensorsData const> SensorsDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_self_driving_car::SensorsData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_self_driving_car::SensorsData_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_self_driving_car::SensorsData_<ContainerAllocator1> & lhs, const ::ros_self_driving_car::SensorsData_<ContainerAllocator2> & rhs)
{
  return lhs.op_mode == rhs.op_mode &&
    lhs.speed == rhs.speed &&
    lhs.angle == rhs.angle &&
    lhs.motor_cnt == rhs.motor_cnt &&
    lhs.servo_cnt == rhs.servo_cnt &&
    lhs.wheel_1_success == rhs.wheel_1_success &&
    lhs.wheel_2_success == rhs.wheel_2_success &&
    lhs.wheel_3_success == rhs.wheel_3_success &&
    lhs.wheel_4_success == rhs.wheel_4_success;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_self_driving_car::SensorsData_<ContainerAllocator1> & lhs, const ::ros_self_driving_car::SensorsData_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_self_driving_car

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::ros_self_driving_car::SensorsData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_self_driving_car::SensorsData_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_self_driving_car::SensorsData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_self_driving_car::SensorsData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_self_driving_car::SensorsData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_self_driving_car::SensorsData_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_self_driving_car::SensorsData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ca5a2621c8a00e6fea801ce1abd88ec5";
  }

  static const char* value(const ::ros_self_driving_car::SensorsData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xca5a2621c8a00e6fULL;
  static const uint64_t static_value2 = 0xea801ce1abd88ec5ULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_self_driving_car::SensorsData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_self_driving_car/SensorsData";
  }

  static const char* value(const ::ros_self_driving_car::SensorsData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_self_driving_car::SensorsData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string op_mode\n"
"int32 speed\n"
"int32 angle\n"
"uint32 motor_cnt\n"
"uint32 servo_cnt\n"
"bool wheel_1_success\n"
"bool wheel_2_success\n"
"bool wheel_3_success\n"
"bool wheel_4_success\n"
;
  }

  static const char* value(const ::ros_self_driving_car::SensorsData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_self_driving_car::SensorsData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.op_mode);
      stream.next(m.speed);
      stream.next(m.angle);
      stream.next(m.motor_cnt);
      stream.next(m.servo_cnt);
      stream.next(m.wheel_1_success);
      stream.next(m.wheel_2_success);
      stream.next(m.wheel_3_success);
      stream.next(m.wheel_4_success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SensorsData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_self_driving_car::SensorsData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_self_driving_car::SensorsData_<ContainerAllocator>& v)
  {
    s << indent << "op_mode: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.op_mode);
    s << indent << "speed: ";
    Printer<int32_t>::stream(s, indent + "  ", v.speed);
    s << indent << "angle: ";
    Printer<int32_t>::stream(s, indent + "  ", v.angle);
    s << indent << "motor_cnt: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.motor_cnt);
    s << indent << "servo_cnt: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.servo_cnt);
    s << indent << "wheel_1_success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.wheel_1_success);
    s << indent << "wheel_2_success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.wheel_2_success);
    s << indent << "wheel_3_success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.wheel_3_success);
    s << indent << "wheel_4_success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.wheel_4_success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_SELF_DRIVING_CAR_MESSAGE_SENSORSDATA_H
