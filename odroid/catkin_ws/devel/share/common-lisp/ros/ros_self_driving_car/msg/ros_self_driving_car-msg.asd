
(cl:in-package :asdf)

(defsystem "ros_self_driving_car-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ActuatorsCommandData" :depends-on ("_package_ActuatorsCommandData"))
    (:file "_package_ActuatorsCommandData" :depends-on ("_package"))
    (:file "ActuatorsData" :depends-on ("_package_ActuatorsData"))
    (:file "_package_ActuatorsData" :depends-on ("_package"))
    (:file "SensorsData" :depends-on ("_package_SensorsData"))
    (:file "_package_SensorsData" :depends-on ("_package"))
  ))