// Include required libraries
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>
#include <ros.h>
#include <imu_rpy/RPY.h>

// 
sensors_event_t event;

// Create IMU object
Adafruit_BNO055 IMU = Adafruit_BNO055(55, 0x29);

// Create ROS node
ros::NodeHandle  nh;

// We will use custom message
imu_rpy::RPY gyro_msg;

// Create the publisher with our message
ros::Publisher imu_pub("imu", &gyro_msg);

// Publish rate
int rate = 35;

void setup() 
{
  // Start ROS node
  nh.initNode();
  nh.advertise(imu_pub);
  
  // Connect to IMU
  IMU.begin();
  IMU.setExtCrystalUse(true);
}

void loop() 
{
  // Get data from the IMU  
  IMU.getEvent(&event);
  gyro_msg.roll = event.orientation.x;
  gyro_msg.pitch = event.orientation.y;
  gyro_msg.yaw = event.orientation.z;

  // Publish the data to ROS
  imu_pub.publish( &gyro_msg);
  nh.spinOnce();
  
  // Wait to match the publish rate
  delay(int(1000.0 / rate));
}
