# Import necessary libraries
import cv2
import numpy as np
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from collections import deque

# Display image scale
scale = 3

# Vignetting function
vign = cv2.imread("vign.png", -1)
vign_inv = (255 - vign)

# Blending parameter
k = 0.8


# Event function for trackbar
def nothing(x):
    pass


# Window for trackbar and images
cv2.namedWindow("VignettingCorrection")

# Slider for vignetting correction parameter
cv2.createTrackbar("BlendParam", "VignettingCorrection",
                   int(k * 100), 100, nothing)

# Image buffer
buf_size = 1
img_buf = deque(maxlen=buf_size)


def process():
    # Read next frame
    frame = img_buf[0]

    # Apply image blending to correct vignetting
    k = cv2.getTrackbarPos("BlendParam", "VignettingCorrection") / 100.0
    corr = cv2.addWeighted(frame, k, vign_inv, 1 - k, 0)

    # Scale images
    frame = cv2.resize(frame, (0, 0), fx=scale, fy=scale)
    corr = cv2.resize(corr, (0, 0), fx=scale, fy=scale)

    # Stack images
    bar = np.ones_like(frame) * 255
    bar = bar[0:bar.shape[0], 0:10]
    out = np.hstack((frame, bar, corr))

    cv2.imshow("VignettingCorrection", out)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        return 1
    return 0


def IMGcallback(data):
    bridge = CvBridge()

    try:
        cv_image = bridge.imgmsg_to_cv2(data, desired_encoding="passthrough")
    except CvBridgeError as e:
        print(e)

    img_buf.append(cv_image)


def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber('/pico_flexx/image_mono8', Image, IMGcallback)

    while not rospy.core.is_shutdown():
        if len(img_buf) == buf_size:
            if process():
                break
        # rospy.rostime.wallsleep(0.001)


if __name__ == '__main__':
    listener()
