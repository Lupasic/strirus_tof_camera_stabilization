# Install script for directory: /home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/pico_flexx_driver

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/install")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pico_flexx_driver" TYPE FILE FILES "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/devel/include/pico_flexx_driver/pico_flexx_driverConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/pico_flexx_driver" TYPE FILE FILES "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/devel/lib/python2.7/dist-packages/pico_flexx_driver/__init__.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/devel/lib/python2.7/dist-packages/pico_flexx_driver/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/pico_flexx_driver" TYPE DIRECTORY FILES "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/devel/lib/python2.7/dist-packages/pico_flexx_driver/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/build/pico_flexx_driver/catkin_generated/installspace/pico_flexx_driver.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pico_flexx_driver/cmake" TYPE FILE FILES
    "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/build/pico_flexx_driver/catkin_generated/installspace/pico_flexx_driverConfig.cmake"
    "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/build/pico_flexx_driver/catkin_generated/installspace/pico_flexx_driverConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pico_flexx_driver" TYPE FILE FILES "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/pico_flexx_driver/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/pico_flexx_driver/pico_flexx_driver" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/pico_flexx_driver/pico_flexx_driver")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/pico_flexx_driver/pico_flexx_driver"
         RPATH "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/pico_flexx_driver/royale/libroyale-3.21.1.70-LINUX-x86-64Bit/bin")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pico_flexx_driver" TYPE EXECUTABLE FILES "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/devel/lib/pico_flexx_driver/pico_flexx_driver")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/pico_flexx_driver/pico_flexx_driver" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/pico_flexx_driver/pico_flexx_driver")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/pico_flexx_driver/pico_flexx_driver"
         OLD_RPATH "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/pico_flexx_driver/royale/libroyale-3.21.1.70-LINUX-x86-64Bit/bin:/opt/ros/melodic/lib:"
         NEW_RPATH "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/pico_flexx_driver/royale/libroyale-3.21.1.70-LINUX-x86-64Bit/bin")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/pico_flexx_driver/pico_flexx_driver")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpico_flexx_nodelet.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpico_flexx_nodelet.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpico_flexx_nodelet.so"
         RPATH "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/pico_flexx_driver/royale/libroyale-3.21.1.70-LINUX-x86-64Bit/bin")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/devel/lib/libpico_flexx_nodelet.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpico_flexx_nodelet.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpico_flexx_nodelet.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpico_flexx_nodelet.so"
         OLD_RPATH "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/pico_flexx_driver/royale/libroyale-3.21.1.70-LINUX-x86-64Bit/bin:/opt/ros/melodic/lib:"
         NEW_RPATH "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/pico_flexx_driver/royale/libroyale-3.21.1.70-LINUX-x86-64Bit/bin")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpico_flexx_nodelet.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pico_flexx_driver" TYPE DIRECTORY FILES "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/pico_flexx_driver/launch")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pico_flexx_driver" TYPE FILE FILES "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/pico_flexx_driver/nodelet_plugins.xml")
endif()

