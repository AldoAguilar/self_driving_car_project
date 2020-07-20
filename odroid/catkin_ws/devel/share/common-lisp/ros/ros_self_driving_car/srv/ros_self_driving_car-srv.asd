
(cl:in-package :asdf)

(defsystem "ros_self_driving_car-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CalibrateDrivers" :depends-on ("_package_CalibrateDrivers"))
    (:file "_package_CalibrateDrivers" :depends-on ("_package"))
    (:file "LoadArduinoCode" :depends-on ("_package_LoadArduinoCode"))
    (:file "_package_LoadArduinoCode" :depends-on ("_package"))
    (:file "TestDriversCalibration" :depends-on ("_package_TestDriversCalibration"))
    (:file "_package_TestDriversCalibration" :depends-on ("_package"))
  ))