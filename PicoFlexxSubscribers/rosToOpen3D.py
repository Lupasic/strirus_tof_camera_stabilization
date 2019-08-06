# This helper function converts
# ROS PointCloud2 to open3d format

# To install open3d follow this guide: 
# http://www.open3d.org/docs/getting_started.html#install-open3d-python

# To install numpy: pip install numpy

import open3d
import numpy as np
from ctypes import *  # convert float to uint32

import rospy
from std_msgs.msg import Header
from sensor_msgs.msg import PointCloud2, PointField
import sensor_msgs.point_cloud2 as pc2


def cvtPicoRosToOpen3D(ros_cloud):
    # Get cloud data from ros_cloud
    # Field names: ['x', 'y', 'z', 'noise', 'intensity', 'gray']
    field_names = [field.name for field in ros_cloud.fields]
    cloud_data = list(pc2.read_points(
        ros_cloud, skip_nans=True, field_names=field_names))

    # Check empty
    open3d_cloud = open3d.PointCloud()
    if len(cloud_data) == 0:
        print("Converting an empty cloud")
        return None

    # Set open3d_cloud
    xyz = [(x, y, z) for x, y, z, n, i, g in cloud_data]  # get xyz
    open3d_cloud.points = open3d.Vector3dVector(np.array(xyz))

    # return
    return open3d_cloud
