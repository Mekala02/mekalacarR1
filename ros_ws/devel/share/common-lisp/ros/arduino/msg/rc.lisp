; Auto-generated. Do not edit!


(cl:in-package arduino-msg)


;//! \htmlinclude rc.msg.html

(cl:defclass <rc> (roslisp-msg-protocol:ros-message)
  ((Steering
    :reader Steering
    :initarg :Steering
    :type cl:float
    :initform 0.0)
   (Throttle
    :reader Throttle
    :initarg :Throttle
    :type cl:float
    :initform 0.0)
   (Button1
    :reader Button1
    :initarg :Button1
    :type cl:integer
    :initform 0)
   (Button2
    :reader Button2
    :initarg :Button2
    :type cl:integer
    :initform 0))
)

(cl:defclass rc (<rc>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rc>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rc)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arduino-msg:<rc> is deprecated: use arduino-msg:rc instead.")))

(cl:ensure-generic-function 'Steering-val :lambda-list '(m))
(cl:defmethod Steering-val ((m <rc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino-msg:Steering-val is deprecated.  Use arduino-msg:Steering instead.")
  (Steering m))

(cl:ensure-generic-function 'Throttle-val :lambda-list '(m))
(cl:defmethod Throttle-val ((m <rc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino-msg:Throttle-val is deprecated.  Use arduino-msg:Throttle instead.")
  (Throttle m))

(cl:ensure-generic-function 'Button1-val :lambda-list '(m))
(cl:defmethod Button1-val ((m <rc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino-msg:Button1-val is deprecated.  Use arduino-msg:Button1 instead.")
  (Button1 m))

(cl:ensure-generic-function 'Button2-val :lambda-list '(m))
(cl:defmethod Button2-val ((m <rc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino-msg:Button2-val is deprecated.  Use arduino-msg:Button2 instead.")
  (Button2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rc>) ostream)
  "Serializes a message object of type '<rc>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Steering))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Throttle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'Button1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Button2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rc>) istream)
  "Deserializes a message object of type '<rc>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Steering) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Throttle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Button1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Button2) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rc>)))
  "Returns string type for a message object of type '<rc>"
  "arduino/rc")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rc)))
  "Returns string type for a message object of type 'rc"
  "arduino/rc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rc>)))
  "Returns md5sum for a message object of type '<rc>"
  "85d8f319b6d9e8b597120546faa1bbf9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rc)))
  "Returns md5sum for a message object of type 'rc"
  "85d8f319b6d9e8b597120546faa1bbf9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rc>)))
  "Returns full string definition for message of type '<rc>"
  (cl:format cl:nil "float32 Steering~%float32 Throttle~%int32 Button1~%int32 Button2~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rc)))
  "Returns full string definition for message of type 'rc"
  (cl:format cl:nil "float32 Steering~%float32 Throttle~%int32 Button1~%int32 Button2~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rc>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rc>))
  "Converts a ROS message object to a list"
  (cl:list 'rc
    (cl:cons ':Steering (Steering msg))
    (cl:cons ':Throttle (Throttle msg))
    (cl:cons ':Button1 (Button1 msg))
    (cl:cons ':Button2 (Button2 msg))
))
