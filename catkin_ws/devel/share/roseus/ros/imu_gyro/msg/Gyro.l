;; Auto-generated. Do not edit!


(when (boundp 'imu_gyro::Gyro)
  (if (not (find-package "IMU_GYRO"))
    (make-package "IMU_GYRO"))
  (shadow 'Gyro (find-package "IMU_GYRO")))
(unless (find-package "IMU_GYRO::GYRO")
  (make-package "IMU_GYRO::GYRO"))

(in-package "ROS")
;;//! \htmlinclude Gyro.msg.html


(defclass imu_gyro::Gyro
  :super ros::object
  :slots (_rpsX _rpsY _rpsZ ))

(defmethod imu_gyro::Gyro
  (:init
   (&key
    ((:rpsX __rpsX) 0.0)
    ((:rpsY __rpsY) 0.0)
    ((:rpsZ __rpsZ) 0.0)
    )
   (send-super :init)
   (setq _rpsX (float __rpsX))
   (setq _rpsY (float __rpsY))
   (setq _rpsZ (float __rpsZ))
   self)
  (:rpsX
   (&optional __rpsX)
   (if __rpsX (setq _rpsX __rpsX)) _rpsX)
  (:rpsY
   (&optional __rpsY)
   (if __rpsY (setq _rpsY __rpsY)) _rpsY)
  (:rpsZ
   (&optional __rpsZ)
   (if __rpsZ (setq _rpsZ __rpsZ)) _rpsZ)
  (:serialization-length
   ()
   (+
    ;; float32 _rpsX
    4
    ;; float32 _rpsY
    4
    ;; float32 _rpsZ
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _rpsX
       (sys::poke _rpsX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rpsY
       (sys::poke _rpsY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rpsZ
       (sys::poke _rpsZ (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _rpsX
     (setq _rpsX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rpsY
     (setq _rpsY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rpsZ
     (setq _rpsZ (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get imu_gyro::Gyro :md5sum-) "03288a553ea1034d214a7713078c4a04")
(setf (get imu_gyro::Gyro :datatype-) "imu_gyro/Gyro")
(setf (get imu_gyro::Gyro :definition-)
      "float32 rpsX
float32 rpsY
float32 rpsZ

")



(provide :imu_gyro/Gyro "03288a553ea1034d214a7713078c4a04")


