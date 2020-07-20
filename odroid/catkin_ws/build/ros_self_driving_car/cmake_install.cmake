# Install script for directory: /home/odroid/self_driving_car_project/odroid/catkin_ws/src/ros_self_driving_car

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/odroid/self_driving_car_project/odroid/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_self_driving_car/msg" TYPE FILE FILES
    "/home/odroid/self_driving_car_project/odroid/catkin_ws/src/ros_self_driving_car/msg/SensorsData.msg"
    "/home/odroid/self_driving_car_project/odroid/catkin_ws/src/ros_self_driving_car/msg/ActuatorsData.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_self_driving_car/srv" TYPE FILE FILES
    "/home/odroid/self_driving_car_project/odroid/catkin_ws/src/ros_self_driving_car/srv/CalibrateDrivers.srv"
    "/home/odroid/self_driving_car_project/odroid/catkin_ws/src/ros_self_driving_car/srv/LoadArduinoCode.srv"
    "/home/odroid/self_driving_car_project/odroid/catkin_ws/src/ros_self_driving_car/srv/TestDriversCalibration.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_self_driving_car/cmake" TYPE FILE FILES "/home/odroid/self_driving_car_project/odroid/catkin_ws/build/ros_self_driving_car/catkin_generated/installspace/ros_self_driving_car-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/odroid/self_driving_car_project/odroid/catkin_ws/devel/include/ros_self_driving_car")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/odroid/self_driving_car_project/odroid/catkin_ws/devel/share/roseus/ros/ros_self_driving_car")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/odroid/self_driving_car_project/odroid/catkin_ws/devel/share/common-lisp/ros/ros_self_driving_car")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/odroid/self_driving_car_project/odroid/catkin_ws/devel/share/gennodejs/ros/ros_self_driving_car")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/odroid/self_driving_car_project/odroid/catkin_ws/devel/lib/python2.7/dist-packages/ros_self_driving_car")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/odroid/self_driving_car_project/odroid/catkin_ws/devel/lib/python2.7/dist-packages/ros_self_driving_car")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/odroid/self_driving_car_project/odroid/catkin_ws/build/ros_self_driving_car/catkin_generated/installspace/ros_self_driving_car.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_self_driving_car/cmake" TYPE FILE FILES "/home/odroid/self_driving_car_project/odroid/catkin_ws/build/ros_self_driving_car/catkin_generated/installspace/ros_self_driving_car-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_self_driving_car/cmake" TYPE FILE FILES
    "/home/odroid/self_driving_car_project/odroid/catkin_ws/build/ros_self_driving_car/catkin_generated/installspace/ros_self_driving_carConfig.cmake"
    "/home/odroid/self_driving_car_project/odroid/catkin_ws/build/ros_self_driving_car/catkin_generated/installspace/ros_self_driving_carConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_self_driving_car" TYPE FILE FILES "/home/odroid/self_driving_car_project/odroid/catkin_ws/src/ros_self_driving_car/package.xml")
endif()

