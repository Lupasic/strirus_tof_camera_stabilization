# CameraStabilization instructions
## ROS environment preparation
This instruction is for Ubuntu 18.04 and ROS Melodic. For Ubuntu 16.04 and ROS Kinetic there is a [good tutorial](https://pmdtec.com/picofamily/2018/04/05/ros-support-for-pico-flexx-and-pico-monstar/) in the PicoFlexx library. This  [Video turorial](https://www.youtube.com/watch?v=APwUFignQ_A) is for Kinetic, but can be used as a reference.

1. [Install](http://wiki.ros.org/melodic/Installation/Ubuntu) ROS Melodic
2. Create a [Catkin Workspace](http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment). These commands will create a workspace in the home directory. You can choose any directory you like.
`mkdir -p ~/catkin_ws/src`
`cd ~/catkin_ws/`
`catkin_make`
3. [Download](https://pmdtec.com/picofamily/software-download/) PicoFlexx SDK.
4. [Download](https://github.com/code-iai/pico_flexx_driver) the wrapper.
5. Rename the wrapper folder from `pico_flexx_driver_master` to `pico_flexx_driver` and put it into ` ~/catkin_ws/src/`
6. Find the architecture type of your system with `uname -m` and extract necessary libroyale SDK folder. to `<catkin_ws>/src/pico_flexx_driver/royale`
7. Install the udev rules provided by the SDK
`cd <catkin_ws>/src/pico_flexx_driver/royale`
`sudo cp libroyale-*/driver/udev/10-royale-ubuntu.rules /etc/udev/rules.d/`
8. `cd <catkin_ws>/` and run `catkin_make` or `catkin build` (if you prefer catkin_tools)
9. Add launch files to roslaunch `source devel/setup.bash` 

## Point cloud in Rviz
I assume you did ROS environment preparation.
1. Plug in the CamBoard pico flexx device
2. Run `roslaunch pico_flexx_driver pico_flexx_driver.launch publish_tf:=true`
	>You might get the message
`RLException: [pico_flexx_driver.launch] is neither a launch file in package [pico_flexx_driver] nor is [pico_flexx_driver] a launch file name
The traceback for the exception was written to the log file
`
To fix it do steps 8 and 9 from ROS environment preparation
3. Start Rviz `rosrun rviz rviz`
4. Set the `Fixed frame` to `pico_flexx_link`
5. Add a `PointCloud2` from `By topic` tab and select `/pico_flexx/points`

#### Parameters for roslaunch

The launch file has the following parameters:

- `base_name` (default="pico_flexx"):

  Name of the node. All topics will be advertised under this name.

- `sensor` (default=""):

  ID of the sensor that should be used. IDs of all connected devices are listed on startup.

- `use_case` (default="0"):

  ID of the use case. A list of supported use cases is listed on startup.

- `automatic_exposure` (default="true"):

  Enable or disable automatic exposure.

- `automatic_exposure_stream2` (default="true"):

  Enable or disable automatic exposure for stream 2.

- `exposure_time` (default="1000"):

  Exposure time. Only for manual exposure.

- `exposure_time_stream2` (default="1000"):

  Exposure time for stream 2. Only for manual exposure.

- `max_noise` (default="0.07"):

  Maximum allowed noise. Data with higher noise will be filtered out.

- `range_factor` (default="2.0"):

  Range of the 16-Bit mono image which should be mapped to the 0-255 range of the 8-Bit mono image. The resulting range is `range_factor` times the standard deviation around mean.

- `queue_size` (default="5"):

  Queue size for publisher.

- `publish_tf` (default="false"):

  Publish a static TF transform for the optical frame of the camera.

- `base_name_tf` (default="pico_flexx"):

  Base name of the tf frames.

- `machine` (default="localhost"):

  Machine on with the nodes should run.

- `define_machine` (default="true"):

  Whether the machine for localhost should be defined our not. Disable this if the launch file is included somewhere where machines are already defined.

- `nodelet_manager` (default="pico_flexx"):

  Name of the nodelet manager.

- `start_manager` (default="true"):

  Whether to start a nodelet manager our not. Disable this if a different nodelet manager should be used.

#### Dynamic reconfigure

Some parameters can be reconfigured during runtime, for example with `rosrun rqt_reconfigure rqt_reconfigure`. The reconfigurable parameters are:
- `use_case`:

  Choose from a list of use cases.

- `exposure_mode`, `exposure_mode_stream2`:

  `AUTOMATIC` or `MANUAL`.

- `exposure_time`, `exposure_time_stream2`:

  Exposure time. Only for manual exposure.

- `max_noise`:

  Maximum allowed noise. Data with higher noise will be filtered out.

- `range_factor`:

  Range of the 16-Bit mono image which should be mapped to the 0-255 range of the 8-Bit mono image. The resulting range is `range_factor` times the standard deviation around mean.

#### Topics

When a mixed mode use case is selected, the second stream for all topics below
is published under the `stream2` namespace (e.g.,
`/pico_flexx/stream2/points`). In mixed mode, both a low-range, high-noise,
high-frequency point cloud and a high-range, low-noise, low-frequency (5 Hz)
point cloud are published. The 5 Hz point cloud in mixed mode only allows a
maximum exposure time of 1300 microseconds, so it has slightly higher noise
than the 5 Hz point cloud in single mode at 2000 microseconds.

##### `/pico_flexx/camera_info`
Bandwidth: 0.37 KB per message (@5 Hz: ~2 KB/s, @45 Hz: ~ 17 KB/s)

This topic publishes the camera intrinsic parameters.

Message type: [CameraInfo](http://docs.ros.org/api/sensor_msgs/html/msg/CameraInfo.html)

##### `/pico_flexx/image_depth`
Bandwidth: 153.28 KB per message (@5 Hz: ~766 KB/s, @45 Hz: ~ 6897 KB/s)

This is the distorted depth image. It is a 32-Bit float image where each pixel is a distance measured in meters along the optical axis.

##### `/pico_flexx/image_mono16`
Bandwidth: 76.67 KB per message (@5 Hz: ~383 KB/s, @45 Hz: ~ 3450 KB/s)

This is the distorted IR image. It is a 16-Bit image where each pixel is an intensity measurement.

##### `/pico_flexx/image_mono8`
Bandwidth: 38.37 KB per message (@5 Hz: ~192 KB/s, @45 Hz: ~ 1727 KB/s)

This is the distorted IR image. It is a 8-Bit image where each pixel is an intensity measurement.

Message type: [Image](http://docs.ros.org/api/sensor_msgs/html/msg/Image.html)

##### `/pico_flexx/image_noise`
Bandwidth: 153.28 KB per message (@5 Hz: ~766 KB/s, @45 Hz: ~ 6897 KB/s)

This is the distorted noise image. It is a 32-Bit float image where each pixel is a noise value of the corresponding depth pixel (standard deviation, measured in meters).

##### `/pico_flexx/points`
Bandwidth: 720 KB per message (@5 Hz: ~3600 KB/s, @45 Hz: ~ 32400 KB/s)

This is the point cloud created by the sensor. It contains 6 fields in the following order: X, Y, Z, Noise (float), Intensity (16-Bit), Gray (8-Bit).
The 3D points themselves are undistorted, while the 2D coordinates of the points are distorted. The point cloud is organized, so that the each point belongs to the pixel with the same index in one of the other images.

Message type: [PointCloud2]([http://docs.ros.org/api/sensor_msgs/html/msg/PointCloud2.html](http://docs.ros.org/api/sensor_msgs/html/msg/PointCloud2.html))

# ROS PicoFlexx data subscriber
To use data from PicoFlexx we need to collect it. For that we need to subscribe on desired topic described above. Here is a sample program for retrieving camera info
```
# Import necessary libraries
import rospy
from sensor_msgs.msg import CameraInfo

# This function invokes when new data is received
def info(data):
	print(data)

# This function creates a subscriber
def listener():
	# Initialization
    rospy.init_node('stabilizer', anonymous=True)
    # Subscribe on desired topic
    rospy.Subscriber('/pico_flexx/camera_info', CameraInfo, info)
    # Loop while roscore is active
    rospy.spin()

if __name__ == '__main__':
    listener()
```

To subscribe on topic we must know the topic name and its message type.
To find available topic names use `rostopic list`
To find message type use `rostopic info <topicname>`
Other usefull commands can be found with `rostopic -h`

The sample data retrieval exmples can be found [here](https://github.com/Sarrasor/CameraStabilization/tree/master/PicoFlexxSubscribers)
 
 # Arduino IMU data publisher/subscriber
We have BNO055 IMU. I've used the Adafruit Library for it. To install the library and go through the examples follow the link to the library.

[Link](https://learn.adafruit.com/adafruit-bno055-absolute-orientation-sensor/overview) to BNO055 library.

 I've connected IMU to Arduino. To retrieve data from Arduino with ROS we need `rosserial_arduino`. Here is an [installation guide](http://wiki.ros.org/rosserial_arduino/Tutorials/Arduino%20IDE%20Setup#Installing_the_Software). I need a custom ROS message for the IMU. Let's create one.
## ROS custom message
1. Create a new package in your catkin workspace src folder with ` catkin_create_pkg <pkg_name>`
2. Create a message in your package in order to use it when creating subscriber. [Tutorial](http://wiki.ros.org/ROS/Tutorials/CreatingMsgAndSrv#Creating_a_msg). There is a probability that `catkin_wokspace install` may produce the `catkin_package() DEPENDS on the catkin package 'other_catkin_pkg' which
  must therefore be listed as a run dependency in the package.xml
` error. To fix it add `<exec_depend>other_catkin_pkg</exec_depend>` to `package.xml`
3. Execute `source install/setup.bash` and check your message with `rosmsg info <your_msg>`. It should print your .msg file.
4. Create ROS Arduino Library. Check your Arduino libraries path and replace it in commands if necessary. 
`rm -r ~/Arduino/libraries/ros_lib` 
`rosrun rosserial_arduino make_libraries.py ~/Arduino/libraries`
5. Add your message to Arduino library. First, create folders with your messages in temporary directory.
`rosrun rosserial_client make_libraries ~/Arduino/temp`
6. Copy required messages to `~/Arduino/libraries/ros_lib` and delete temp directory

## Arduino Publisher
Now, let's create an IMU data publisher.  This code is for Arduino.
```
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
```

Upload this sketch to Arduino and continue.

To retrieve data from Arduino we need to know the port the Arduino is connected. To do that, write the following command in terminal:

`ls -l /dev/ttyACM*`

  To run the ROS-serial  use the following command:
  
`rosrun rosserial_arduino serial_node.py _port:=/dev/ttyACM0`

## ROS subscriber to retrieve IMU data
Here is a simple way to retreive data from Arduino IMU. 
```
import rospy
from imu_rpy.msg import RPY
from collections import deque

# Buffer for the IMU data
buf_size = 1
rpy_buf = deque(maxlen=buf_size)


# Callback function when new data arrived
def GyroCallback(data):
    # Degrees to radians convertation
    d2r = 0.0174533
    rpy_buf.append([data.roll * d2r, data.pitch * d2r, data.yaw * d2r])
    print(rpy_buf[0][0], rpy_buf[0][1], rpy_buf[0][2])


def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber('/imu', RPY, GyroCallback)
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")


if __name__ == '__main__':
    listener()
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTcyNTQ1Njk3NywtMTk0MjczNDMwMSwtMT
AwNzE4NjgxNiwtMjU4MjA5MzIsNzI4MTI3ODg4LDQzOTUzNjYx
Ml19
-->