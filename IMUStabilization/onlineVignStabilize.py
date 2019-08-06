import rospy
from open3d import *
from imu_rpy.msg import RPY
from sensor_msgs.msg import Image
import cv2
from cv_bridge import CvBridge, CvBridgeError
from utils import readData, readRPY, rpyToRot, rpyToXYTh
from collections import deque
from scipy.ndimage import gaussian_filter1d
from math import pi
from matplotlib import pyplot as plt

framerate = 35.0
dt = 1.0 / framerate

# Vignetting function
vign = cv2.imread("vign.png", -1)
vign_inv = (255 - vign)

# Blending parameter
k = 0.8


# Event function for trackbar
def nothing(x):
    pass


# Window for trackbar and images
cv2.namedWindow("Stabilization")

# Slider for vignetting correction parameter
cv2.createTrackbar("BlendParam", "Stabilization",
                   int(k * 100), 100, nothing)

time = 0
buf_size = 1
rpy_buf = deque(maxlen=buf_size)
img_buf = deque(maxlen=buf_size)
time_buf = deque(maxlen=buf_size)

K = np.matrix("211.10128784179688, 0.0, 112.65359497070312; \
               0.0, 211.10128784179688, 87.98176574707031; \
               0.0, 0.0, 1.0")

crop = 0.8
show_scale = 2

vc_init = 0
vr = 0
vp = 0
vy = 0

def process():
    global vc_init, vr, vp, vy    

    # Apply image blending to correct vignetting
    k = cv2.getTrackbarPos("BlendParam", "Stabilization") / 100.0
    corr = cv2.addWeighted(img_buf[0], k, vign_inv, 1 - k, 0)

    frame = cv2.cvtColor(corr, cv2.COLOR_GRAY2BGR)

    black = np.ones_like(frame)
    black = black + 50
    crop_x = int((frame.shape[0] - crop*frame.shape[0]) / 2)
    crop_y = int((frame.shape[1] - crop*frame.shape[1]) / 2)
    w = crop_x + int(frame.shape[0] * crop)
    h = crop_y + int(frame.shape[1] * crop)

    mask = np.full((frame.shape[0], frame.shape[1]), 0, dtype=np.uint8)
    mask[crop_x:w, crop_y:h] = 255
    mask_inv = cv2.bitwise_not(mask)

    edit_in = cv2.add(np.zeros_like(frame), frame, mask=mask)
    edit_out = cv2.subtract(frame, black, mask=mask_inv)
    edit = cv2.add(edit_in, edit_out)

    cv2.circle(edit, (crop_y, crop_x), 3, (0, 0, 255), -1) 
    cv2.circle(edit, (crop_y, w), 3, (0, 255, 0), -1) 
    cv2.circle(edit, (h, crop_x), 3, (255, 0, 0), -1) 
    cv2.circle(edit, (h, w), 3, (0, 255, 255), -1) 

    r = rpy_buf[0][0]
    if (r > pi):
        r -= 2*pi
    p = rpy_buf[0][1]
    y = rpy_buf[0][2]

    if not vc_init:
        vc_init = 1
        vr = r
        vp = p
        vy = y

    # print(round(r, 2), round(p, 2), round(y,2))

    image_center = tuple(np.array(frame.shape[1::-1]) / 2)
    R = cv2.getRotationMatrix2D(image_center,  57.296 * y, 1.0)
    warped = cv2.warpAffine(frame, R, frame.shape[1::-1], flags=cv2.INTER_CUBIC)  

    T = np.float32([[1, 0, K[0, 0] * -(vp-p)],
                    [0, 1, K[0, 0] * (vr-r)]])

    TT = np.float32([[1, 0, K[0, 0] * -(vr-r)],
                    [0, 1, K[0, 0] * (vp-p)]])

    # T = np.float32([[1, 0, 0],
                    # [0, 1, 0]])

    warped = cv2.warpAffine(warped, TT, (frame.shape[1], frame.shape[0]))

    warped = warped[crop_x:w, crop_y:h]
    warped = cv2.resize(warped, (0,0), fx=1.0/crop, fy=1.0/crop) 
    warped = cv2.resize(warped, (frame.shape[1], frame.shape[0]), interpolation = cv2.INTER_AREA)

    tl = [[crop_x], [crop_y], [1]]
    tr = [[crop_x], [h], [1]]
    bl = [[w], [crop_y], [1]]
    br = [[w], [h], [1]]

    new_tl = np.dot(T, tl)
    new_tr = np.dot(T, tr)
    new_bl = np.dot(T, bl)
    new_br = np.dot(T, br)

    dx = 0.002
    dy = 0.002

    if new_tl[1] < 0:
        vr += dx * (0-new_tl[1])

    if new_tl[0] < 0:
        vp -= dy * (0-new_tl[0])   

    if new_tr[1] > frame.shape[1]:
        vr -= dx * (new_tr[1]-frame.shape[1]) 

    if new_br[0] > frame.shape[0]:
        vp += dy * (new_br[0]-frame.shape[0])       

    new_tl = np.dot(R, [new_tl[0], new_tl[1], [1]])
    new_tr = np.dot(R, [new_tr[0], new_tr[1], [1]])
    new_bl = np.dot(R, [new_bl[0], new_bl[1], [1]])
    new_br = np.dot(R, [new_br[0], new_br[1], [1]]) 

    cv2.circle(edit, (new_tl[1], new_tl[0]), 3, (0, 0, 127), -1) 
    cv2.circle(edit, (new_tr[1], new_tr[0]), 3, (127, 0, 0), -1) 
    cv2.circle(edit, (new_bl[1], new_bl[0]), 3, (0, 127, 0), -1) 
    cv2.circle(edit, (new_br[1], new_br[0]), 3, (0, 127, 127), -1) 

    cv2.line(edit, (new_tl[1], new_tl[0]), (new_bl[1], new_bl[0]), (0, 255, 0), 1)
    cv2.line(edit, (new_tl[1], new_tl[0]), (new_tr[1], new_tr[0]), (0, 255, 0), 1)
    cv2.line(edit, (new_br[1], new_br[0]), (new_tr[1], new_tr[0]), (0, 255, 0), 1)
    cv2.line(edit, (new_br[1], new_br[0]), (new_bl[1], new_bl[0]), (0, 255, 0), 1)

    # cut = frame[int(new_tl[0]):int(new_br[0]), int(new_tl[1]):int(new_br[1])]
    # cut = cv2.resize(cut, (frame.shape[1], frame.shape[0]), interpolation = cv2.INTER_AREA)

    # points_from = np.array([(tl[1][0], tl[0][0]), (tr[1][0], tr[0][0]),
    #                         (bl[1][0], bl[0][0]), (br[1][0], br[0][0])])
    # points_from = np.float32(points_from[:, np.newaxis, :])

    # points_to = np.array([(new_tl[1][0], new_tl[0][0]), (new_tr[1][0], new_tr[0][0]),
    #                       (new_bl[1][0], new_bl[0][0]), (new_br[1][0],new_br[0][0])])
    # points_to = np.float32(points_to[:, np.newaxis, :])

    # H, _ = cv2.findHomography(points_from, points_to)
    # warped = cv2.warpPerspective(frame, H, (frame.shape[1], frame.shape[0]))

    d2r =  0.0174533
    r_msg = str(r/d2r)
    p_msg = str(p/d2r)
    y_msg = str(y/d2r)
    cv2.putText(frame, r_msg, (5, 10), cv2.FONT_HERSHEY_SIMPLEX, 0.35, (0,255,0), 0)
    cv2.putText(frame, p_msg, (5, 25), cv2.FONT_HERSHEY_SIMPLEX, 0.35, (0,255,0), 0)
    cv2.putText(frame, y_msg, (5, 40), cv2.FONT_HERSHEY_SIMPLEX, 0.35, (0,255,0), 0)

    # hist = cv2.calcHist([frame],[0],None,[256],[0,256])
    # plt.plot(hist)
    # plt.xlim([0,256])
    # plt.show()

    frame = cv2.resize(frame, (0,0), fx=show_scale, fy=show_scale) 
    edit = cv2.resize(edit, (0,0), fx=show_scale, fy=show_scale) 
    warped = cv2.resize(warped, (0,0), fx=show_scale, fy=show_scale) 
    # cut = cv2.resize(cut, (0,0), fx=show_scale, fy=show_scale) 


    # cor = cv2.add(warped, 10)
    # cor = cv2.fastNlMeansDenoising(warped, None, 25, 7, 21)

    # out = np.hstack((frame, edit)) 
    bar = np.ones_like(frame) * 255
    bar = bar[0:bar.shape[0], 0:10]
    out = np.hstack((frame, bar, edit, bar, warped, bar))
    cv2.imshow("Stabilization", out)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        return 1
    return 0    

def GyroCallback(data):
    d2r =  0.0174533
    rpy_buf.append([data.roll*d2r, data.pitch*d2r, data.yaw*d2r])

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
    rospy.Subscriber('/imu', RPY, GyroCallback)
    
    while not rospy.core.is_shutdown():
        if len(img_buf) == buf_size:
            if process():
                break
        # rospy.rostime.wallsleep(0.001)        

if __name__ == '__main__':
    listener()