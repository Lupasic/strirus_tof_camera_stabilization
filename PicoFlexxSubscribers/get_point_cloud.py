# This example shows how to retrieve PicoFlexx
# depth point cloud and convert it to open3d format

# To install open3d follow this guide: 
# http://www.open3d.org/docs/getting_started.html#install-open3d-python

# Import necessary libraries
import rospy
from open3d import *
from sensor_msgs.msg import PointCloud2
from rosToOpen3D import cvtPicoRosToOpen3D


# This function invokes when new data is received
def CloudCallback(ros_cloud):
    print("Received a cloud")
    # Convert to open3d format
    open3d_cloud = cvtPicoRosToOpen3D(ros_cloud)


# This function creates a subscriber
def listener():
    # Initialization
    rospy.init_node('point_cloud_sub', anonymous=True)
    # Subscribe on desired topic
    # First argument: name of the topic.
    # Can be found with rostopic list
    # Second argument: type of the topic message.
    # Can be found with rostopic info <topicname>
    # Third argument: the function to invoke after data retrieval
    rospy.Subscriber('/pico_flexx/points', PointCloud2, CloudCallback)
    # Loop while roscore is active
    rospy.spin()


if __name__ == '__main__':
    listener()
