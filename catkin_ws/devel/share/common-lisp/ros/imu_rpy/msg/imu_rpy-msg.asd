
(cl:in-package :asdf)

(defsystem "imu_rpy-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RPY" :depends-on ("_package_RPY"))
    (:file "_package_RPY" :depends-on ("_package"))
  ))