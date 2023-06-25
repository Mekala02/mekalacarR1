
(cl:in-package :asdf)

(defsystem "arduino-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "rc" :depends-on ("_package_rc"))
    (:file "_package_rc" :depends-on ("_package"))
  ))