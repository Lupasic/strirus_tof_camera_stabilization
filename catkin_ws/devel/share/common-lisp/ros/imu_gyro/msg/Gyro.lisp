; Auto-generated. Do not edit!


(cl:in-package imu_gyro-msg)


;//! \htmlinclude Gyro.msg.html

(cl:defclass <Gyro> (roslisp-msg-protocol:ros-message)
  ((rpsX
    :reader rpsX
    :initarg :rpsX
    :type cl:float
    :initform 0.0)
   (rpsY
    :reader rpsY
    :initarg :rpsY
    :type cl:float
    :initform 0.0)
   (rpsZ
    :reader rpsZ
    :initarg :rpsZ
    :type cl:float
    :initform 0.0))
)

(cl:defclass Gyro (<Gyro>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Gyro>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Gyro)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_gyro-msg:<Gyro> is deprecated: use imu_gyro-msg:Gyro instead.")))

(cl:ensure-generic-function 'rpsX-val :lambda-list '(m))
(cl:defmethod rpsX-val ((m <Gyro>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_gyro-msg:rpsX-val is deprecated.  Use imu_gyro-msg:rpsX instead.")
  (rpsX m))

(cl:ensure-generic-function 'rpsY-val :lambda-list '(m))
(cl:defmethod rpsY-val ((m <Gyro>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_gyro-msg:rpsY-val is deprecated.  Use imu_gyro-msg:rpsY instead.")
  (rpsY m))

(cl:ensure-generic-function 'rpsZ-val :lambda-list '(m))
(cl:defmethod rpsZ-val ((m <Gyro>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_gyro-msg:rpsZ-val is deprecated.  Use imu_gyro-msg:rpsZ instead.")
  (rpsZ m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Gyro>) ostream)
  "Serializes a message object of type '<Gyro>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rpsX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rpsY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rpsZ))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Gyro>) istream)
  "Deserializes a message object of type '<Gyro>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rpsX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rpsY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rpsZ) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Gyro>)))
  "Returns string type for a message object of type '<Gyro>"
  "imu_gyro/Gyro")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Gyro)))
  "Returns string type for a message object of type 'Gyro"
  "imu_gyro/Gyro")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Gyro>)))
  "Returns md5sum for a message object of type '<Gyro>"
  "03288a553ea1034d214a7713078c4a04")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Gyro)))
  "Returns md5sum for a message object of type 'Gyro"
  "03288a553ea1034d214a7713078c4a04")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Gyro>)))
  "Returns full string definition for message of type '<Gyro>"
  (cl:format cl:nil "float32 rpsX~%float32 rpsY~%float32 rpsZ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Gyro)))
  "Returns full string definition for message of type 'Gyro"
  (cl:format cl:nil "float32 rpsX~%float32 rpsY~%float32 rpsZ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Gyro>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Gyro>))
  "Converts a ROS message object to a list"
  (cl:list 'Gyro
    (cl:cons ':rpsX (rpsX msg))
    (cl:cons ':rpsY (rpsY msg))
    (cl:cons ':rpsZ (rpsZ msg))
))
