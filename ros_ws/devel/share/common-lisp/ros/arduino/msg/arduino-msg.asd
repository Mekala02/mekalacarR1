
(cl:in-package :asdf)

(defsystem "arduino-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ArduinoMsg" :depends-on ("_package_ArduinoMsg"))
    (:file "_package_ArduinoMsg" :depends-on ("_package"))
  ))