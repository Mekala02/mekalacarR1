;; Auto-generated. Do not edit!


(when (boundp 'arduino::ArduinoMsg)
  (if (not (find-package "ARDUINO"))
    (make-package "ARDUINO"))
  (shadow 'ArduinoMsg (find-package "ARDUINO")))
(unless (find-package "ARDUINO::ARDUINOMSG")
  (make-package "ARDUINO::ARDUINOMSG"))

(in-package "ROS")
;;//! \htmlinclude ArduinoMsg.msg.html


(defclass arduino::ArduinoMsg
  :super ros::object
  :slots (_Steering _Throttle _Speed _Mod1 _Mod2 ))

(defmethod arduino::ArduinoMsg
  (:init
   (&key
    ((:Steering __Steering) 0.0)
    ((:Throttle __Throttle) 0.0)
    ((:Speed __Speed) 0.0)
    ((:Mod1 __Mod1) 0)
    ((:Mod2 __Mod2) 0)
    )
   (send-super :init)
   (setq _Steering (float __Steering))
   (setq _Throttle (float __Throttle))
   (setq _Speed (float __Speed))
   (setq _Mod1 (round __Mod1))
   (setq _Mod2 (round __Mod2))
   self)
  (:Steering
   (&optional __Steering)
   (if __Steering (setq _Steering __Steering)) _Steering)
  (:Throttle
   (&optional __Throttle)
   (if __Throttle (setq _Throttle __Throttle)) _Throttle)
  (:Speed
   (&optional __Speed)
   (if __Speed (setq _Speed __Speed)) _Speed)
  (:Mod1
   (&optional __Mod1)
   (if __Mod1 (setq _Mod1 __Mod1)) _Mod1)
  (:Mod2
   (&optional __Mod2)
   (if __Mod2 (setq _Mod2 __Mod2)) _Mod2)
  (:serialization-length
   ()
   (+
    ;; float32 _Steering
    4
    ;; float32 _Throttle
    4
    ;; float32 _Speed
    4
    ;; int32 _Mod1
    4
    ;; int32 _Mod2
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
     ;; float32 _Speed
       (sys::poke _Speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _Mod1
       (write-long _Mod1 s)
     ;; int32 _Mod2
       (write-long _Mod2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Steering
     (setq _Steering (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Throttle
     (setq _Throttle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Speed
     (setq _Speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _Mod1
     (setq _Mod1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Mod2
     (setq _Mod2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get arduino::ArduinoMsg :md5sum-) "2dd34a0ac459b6a9c29d0a7b4fcad2b7")
(setf (get arduino::ArduinoMsg :datatype-) "arduino/ArduinoMsg")
(setf (get arduino::ArduinoMsg :definition-)
      "float32 Steering
float32 Throttle
float32 Speed
int32 Mod1
int32 Mod2
")



(provide :arduino/ArduinoMsg "2dd34a0ac459b6a9c29d0a7b4fcad2b7")


