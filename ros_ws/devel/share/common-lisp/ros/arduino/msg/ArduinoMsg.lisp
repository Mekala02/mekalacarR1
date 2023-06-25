; Auto-generated. Do not edit!


(cl:in-package arduino-msg)


;//! \htmlinclude ArduinoMsg.msg.html

(cl:defclass <ArduinoMsg> (roslisp-msg-protocol:ros-message)
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
   (Speed
    :reader Speed
    :initarg :Speed
    :type cl:float
    :initform 0.0)
   (Mod1
    :reader Mod1
    :initarg :Mod1
    :type cl:integer
    :initform 0)
   (Mod2
    :reader Mod2
    :initarg :Mod2
    :type cl:integer
    :initform 0))
)

(cl:defclass ArduinoMsg (<ArduinoMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArduinoMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArduinoMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arduino-msg:<ArduinoMsg> is deprecated: use arduino-msg:ArduinoMsg instead.")))

(cl:ensure-generic-function 'Steering-val :lambda-list '(m))
(cl:defmethod Steering-val ((m <ArduinoMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino-msg:Steering-val is deprecated.  Use arduino-msg:Steering instead.")
  (Steering m))

(cl:ensure-generic-function 'Throttle-val :lambda-list '(m))
(cl:defmethod Throttle-val ((m <ArduinoMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino-msg:Throttle-val is deprecated.  Use arduino-msg:Throttle instead.")
  (Throttle m))

(cl:ensure-generic-function 'Speed-val :lambda-list '(m))
(cl:defmethod Speed-val ((m <ArduinoMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino-msg:Speed-val is deprecated.  Use arduino-msg:Speed instead.")
  (Speed m))

(cl:ensure-generic-function 'Mod1-val :lambda-list '(m))
(cl:defmethod Mod1-val ((m <ArduinoMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino-msg:Mod1-val is deprecated.  Use arduino-msg:Mod1 instead.")
  (Mod1 m))

(cl:ensure-generic-function 'Mod2-val :lambda-list '(m))
(cl:defmethod Mod2-val ((m <ArduinoMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino-msg:Mod2-val is deprecated.  Use arduino-msg:Mod2 instead.")
  (Mod2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArduinoMsg>) ostream)
  "Serializes a message object of type '<ArduinoMsg>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'Mod1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Mod2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArduinoMsg>) istream)
  "Deserializes a message object of type '<ArduinoMsg>"
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Mod1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Mod2) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArduinoMsg>)))
  "Returns string type for a message object of type '<ArduinoMsg>"
  "arduino/ArduinoMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArduinoMsg)))
  "Returns string type for a message object of type 'ArduinoMsg"
  "arduino/ArduinoMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArduinoMsg>)))
  "Returns md5sum for a message object of type '<ArduinoMsg>"
  "2dd34a0ac459b6a9c29d0a7b4fcad2b7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArduinoMsg)))
  "Returns md5sum for a message object of type 'ArduinoMsg"
  "2dd34a0ac459b6a9c29d0a7b4fcad2b7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArduinoMsg>)))
  "Returns full string definition for message of type '<ArduinoMsg>"
  (cl:format cl:nil "float32 Steering~%float32 Throttle~%float32 Speed~%int32 Mod1~%int32 Mod2~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArduinoMsg)))
  "Returns full string definition for message of type 'ArduinoMsg"
  (cl:format cl:nil "float32 Steering~%float32 Throttle~%float32 Speed~%int32 Mod1~%int32 Mod2~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArduinoMsg>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArduinoMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'ArduinoMsg
    (cl:cons ':Steering (Steering msg))
    (cl:cons ':Throttle (Throttle msg))
    (cl:cons ':Speed (Speed msg))
    (cl:cons ':Mod1 (Mod1 msg))
    (cl:cons ':Mod2 (Mod2 msg))
))
