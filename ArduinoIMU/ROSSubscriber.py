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
