import numpy as np
import math
filename = 'data/imu.txt'

def readData(filename):
	f = open(filename, "r")
	size = [int(x) for x in f.readline().split(' ')]
	data = np.zeros((size[0], size[1]))
	for i in range(size[0]):
		data[i] = [float(x) for x in f.readline().split(' ')]
	f.close()
	return data

def readRPY(data):
	t = np.diff(data[:, 3]) * 1e-9
	t = np.append(t ,np.mean(t))

	r = np.zeros((data.shape[0], 1))
	p = np.zeros((data.shape[0], 1))
	y = np.zeros((data.shape[0], 1))
	for i in range(data.shape[0] - 1):
		r[i+1] = r[i] + data[i][0] * t[i]
		p[i+1] = p[i] + data[i][1] * t[i]
		y[i+1] = y[i] + data[i][2] * t[i]
	return r, p, y

def rpyToXYTh(r, p, y, K):
	x = np.zeros((r.shape[0], 1))
	y = np.zeros((r.shape[0], 1))
	th = np.zeros((r.shape[0], 1))
	for t in range(r.shape[0]):
		x[t] = K[0, 0] * y[t]
		y[t] = -K[0, 0] * p[t]
		th[t] = r[t]
	return x, y, th	


def rpyToRot(r, p, y) :
    R_x = np.array([[1, 0, 0],
                    [0, math.cos(r), -math.sin(r)],
                    [0, math.sin(r), math.cos(r)]])
                       
    R_y = np.array([[math.cos(p), 0, math.sin(p)],
                    [0, 1, 0],
                    [-math.sin(p), 0, math.cos(p)]])
                 
    R_z = np.array([[math.cos(y), -math.sin(y), 0],
                    [math.sin(y), math.cos(y), 0],
                    [0, 0, 1]])
                         
    R = np.dot(R_z, np.dot( R_y, R_x ))
 
    return R
