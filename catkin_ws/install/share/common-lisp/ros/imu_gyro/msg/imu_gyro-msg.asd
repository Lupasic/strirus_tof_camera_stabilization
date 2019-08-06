
(cl:in-package :asdf)

(defsystem "imu_gyro-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Gyro" :depends-on ("_package_Gyro"))
    (:file "_package_Gyro" :depends-on ("_package"))
  ))