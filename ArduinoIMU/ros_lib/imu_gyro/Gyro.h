#ifndef _ROS_imu_gyro_Gyro_h
#define _ROS_imu_gyro_Gyro_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace imu_gyro
{

  class Gyro : public ros::Msg
  {
    public:
      typedef float _rpsX_type;
      _rpsX_type rpsX;
      typedef float _rpsY_type;
      _rpsY_type rpsY;
      typedef float _rpsZ_type;
      _rpsZ_type rpsZ;

    Gyro():
      rpsX(0),
      rpsY(0),
      rpsZ(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_rpsX;
      u_rpsX.real = this->rpsX;
      *(outbuffer + offset + 0) = (u_rpsX.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_rpsX.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_rpsX.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_rpsX.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->rpsX);
      union {
        float real;
        uint32_t base;
      } u_rpsY;
      u_rpsY.real = this->rpsY;
      *(outbuffer + offset + 0) = (u_rpsY.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_rpsY.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_rpsY.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_rpsY.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->rpsY);
      union {
        float real;
        uint32_t base;
      } u_rpsZ;
      u_rpsZ.real = this->rpsZ;
      *(outbuffer + offset + 0) = (u_rpsZ.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_rpsZ.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_rpsZ.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_rpsZ.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->rpsZ);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_rpsX;
      u_rpsX.base = 0;
      u_rpsX.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_rpsX.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_rpsX.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_rpsX.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->rpsX = u_rpsX.real;
      offset += sizeof(this->rpsX);
      union {
        float real;
        uint32_t base;
      } u_rpsY;
      u_rpsY.base = 0;
      u_rpsY.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_rpsY.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_rpsY.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_rpsY.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->rpsY = u_rpsY.real;
      offset += sizeof(this->rpsY);
      union {
        float real;
        uint32_t base;
      } u_rpsZ;
      u_rpsZ.base = 0;
      u_rpsZ.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_rpsZ.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_rpsZ.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_rpsZ.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->rpsZ = u_rpsZ.real;
      offset += sizeof(this->rpsZ);
     return offset;
    }

    const char * getType(){ return "imu_gyro/Gyro"; };
    const char * getMD5(){ return "03288a553ea1034d214a7713078c4a04"; };

  };

}
#endif
