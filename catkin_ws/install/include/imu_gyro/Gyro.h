// Generated by gencpp from file imu_gyro/Gyro.msg
// DO NOT EDIT!


#ifndef IMU_GYRO_MESSAGE_GYRO_H
#define IMU_GYRO_MESSAGE_GYRO_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace imu_gyro
{
template <class ContainerAllocator>
struct Gyro_
{
  typedef Gyro_<ContainerAllocator> Type;

  Gyro_()
    : rpsX(0.0)
    , rpsY(0.0)
    , rpsZ(0.0)  {
    }
  Gyro_(const ContainerAllocator& _alloc)
    : rpsX(0.0)
    , rpsY(0.0)
    , rpsZ(0.0)  {
  (void)_alloc;
    }



   typedef float _rpsX_type;
  _rpsX_type rpsX;

   typedef float _rpsY_type;
  _rpsY_type rpsY;

   typedef float _rpsZ_type;
  _rpsZ_type rpsZ;





  typedef boost::shared_ptr< ::imu_gyro::Gyro_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::imu_gyro::Gyro_<ContainerAllocator> const> ConstPtr;

}; // struct Gyro_

typedef ::imu_gyro::Gyro_<std::allocator<void> > Gyro;

typedef boost::shared_ptr< ::imu_gyro::Gyro > GyroPtr;
typedef boost::shared_ptr< ::imu_gyro::Gyro const> GyroConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::imu_gyro::Gyro_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::imu_gyro::Gyro_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace imu_gyro

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'imu_gyro': ['/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_gyro/msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::imu_gyro::Gyro_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::imu_gyro::Gyro_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::imu_gyro::Gyro_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::imu_gyro::Gyro_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::imu_gyro::Gyro_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::imu_gyro::Gyro_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::imu_gyro::Gyro_<ContainerAllocator> >
{
  static const char* value()
  {
    return "03288a553ea1034d214a7713078c4a04";
  }

  static const char* value(const ::imu_gyro::Gyro_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x03288a553ea1034dULL;
  static const uint64_t static_value2 = 0x214a7713078c4a04ULL;
};

template<class ContainerAllocator>
struct DataType< ::imu_gyro::Gyro_<ContainerAllocator> >
{
  static const char* value()
  {
    return "imu_gyro/Gyro";
  }

  static const char* value(const ::imu_gyro::Gyro_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::imu_gyro::Gyro_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 rpsX\n"
"float32 rpsY\n"
"float32 rpsZ\n"
;
  }

  static const char* value(const ::imu_gyro::Gyro_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::imu_gyro::Gyro_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.rpsX);
      stream.next(m.rpsY);
      stream.next(m.rpsZ);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Gyro_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::imu_gyro::Gyro_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::imu_gyro::Gyro_<ContainerAllocator>& v)
  {
    s << indent << "rpsX: ";
    Printer<float>::stream(s, indent + "  ", v.rpsX);
    s << indent << "rpsY: ";
    Printer<float>::stream(s, indent + "  ", v.rpsY);
    s << indent << "rpsZ: ";
    Printer<float>::stream(s, indent + "  ", v.rpsZ);
  }
};

} // namespace message_operations
} // namespace ros

#endif // IMU_GYRO_MESSAGE_GYRO_H
