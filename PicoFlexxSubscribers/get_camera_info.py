# This example shows how to retrieve PicoFlexx
# camera parameters

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
    # First argument: name of the topic.
    # Can be found with rostopic list
    # Second argument: type of the topic message.
    # Can be found with rostopic info <topicname>
    # Third argument: the function to invoke after data retrieval
    rospy.Subscriber('/pico_flexx/camera_info', CameraInfo, info)
    # Loop while roscore is active
    rospy.spin()


if __name__ == '__main__':
    listener()
