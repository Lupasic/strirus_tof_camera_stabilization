# This example shows how to retrieve PicoFlexx
# gray image and convert it to OpenCV format

# You might need to install cv_bridge:
# sudo apt-get install ros-(ROS version name)-cv-bridge
# sudo apt-get install ros-(ROS version name)-vision-opencv

# Import necessary libraries
import cv2
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


# This function invokes when new data is received
def ImageCallback(ros_image):
    # Create bridge converter
    bridge = CvBridge()
    # Convert to OpenCV format
    try:
        cv_image = bridge.imgmsg_to_cv2(
            ros_image, desired_encoding="passthrough")
    except CvBridgeError as e:
        print(e)

    # Show image
    cv2.imshow("Image", cv_image)
    cv2.waitKey(1)


# This function creates a subscriber
def listener():
    # Initialization
    rospy.init_node('image_sub', anonymous=True)
    # Subscribe on desired topic
    # First argument: name of the topic.
    # Can be found with rostopic list
    # Second argument: type of the topic message.
    # Can be found with rostopic info <topicname>
    # Third argument: the function to invoke after data retrieval
    rospy.Subscriber('/pico_flexx/image_mono8', Image, ImageCallback)
    # Loop while roscore is active
    rospy.spin()


if __name__ == '__main__':
    listener()
