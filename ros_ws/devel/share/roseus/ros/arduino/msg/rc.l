;; Auto-generated. Do not edit!


(when (boundp 'arduino::rc)
  (if (not (find-package "ARDUINO"))
    (make-package "ARDUINO"))
  (shadow 'rc (find-package "ARDUINO")))
(unless (find-package "ARDUINO::RC")
  (make-package "ARDUINO::RC"))

(in-package "ROS")
;;//! \htmlinclude rc.msg.html


(defclass arduino::rc
  :super ros::object
  :slots (_Steering _Throttle _Button1 _Button2 ))

(defmethod arduino::rc
  (:init
   (&key
    ((:Steering __Steering) 0.0)
    ((:Throttle __Throttle) 0.0)
    ((:Button1 __Button1) 0)
    ((:Button2 __Button2) 0)
    )
   (send-super :init)
   (setq _Steering (float __Steering))
   (setq _Throttle (float __Throttle))
   (setq _Button1 (round __Button1))
   (setq _Button2 (round __Button2))
   self)
  (:Steering
   (&optional __Steering)
   (if __Steering (setq _Steering __Steering)) _Steering)
  (:Throttle
   (&optional __Throttle)
   (if __Throttle (setq _Throttle __Throttle)) _Throttle)
  (:Button1
   (&optional __Button1)
   (if __Button1 (setq _Button1 __Button1)) _Button1)
  (:Button2
   (&optional __Button2)
   (if __Button2 (setq _Button2 __Button2)) _Button2)
  (:serialization-length
   ()
   (+
    ;; float32 _Steering
    4
    ;; float32 _Throttle
    4
    ;; int32 _Button1
    4
    ;; int32 _Button2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _Steering
       (sys::poke _Steering (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Throttle
       (sys::poke _Throttle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _Button1
       (write-long _Button1 s)
     ;; int32 _Button2
       (write-long _Button2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Steering
     (setq _Steering (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Throttle
     (setq _Throttle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _Button1
     (setq _Button1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Button2
     (setq _Button2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get arduino::rc :md5sum-) "85d8f319b6d9e8b597120546faa1bbf9")
(setf (get arduino::rc :datatype-) "arduino/rc")
(setf (get arduino::rc :definition-)
      "float32 Steering
float32 Throttle
int32 Button1
int32 Button2
")



(provide :arduino/rc "85d8f319b6d9e8b597120546faa1bbf9")


