# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "imu_rpy: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iimu_rpy:/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(imu_rpy_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg/RPY.msg" NAME_WE)
add_custom_target(_imu_rpy_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "imu_rpy" "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg/RPY.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(imu_rpy
  "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg/RPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imu_rpy
)

### Generating Services

### Generating Module File
_generate_module_cpp(imu_rpy
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imu_rpy
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(imu_rpy_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(imu_rpy_generate_messages imu_rpy_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg/RPY.msg" NAME_WE)
add_dependencies(imu_rpy_generate_messages_cpp _imu_rpy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imu_rpy_gencpp)
add_dependencies(imu_rpy_gencpp imu_rpy_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imu_rpy_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(imu_rpy
  "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg/RPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imu_rpy
)

### Generating Services

### Generating Module File
_generate_module_eus(imu_rpy
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imu_rpy
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(imu_rpy_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(imu_rpy_generate_messages imu_rpy_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg/RPY.msg" NAME_WE)
add_dependencies(imu_rpy_generate_messages_eus _imu_rpy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imu_rpy_geneus)
add_dependencies(imu_rpy_geneus imu_rpy_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imu_rpy_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(imu_rpy
  "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg/RPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imu_rpy
)

### Generating Services

### Generating Module File
_generate_module_lisp(imu_rpy
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imu_rpy
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(imu_rpy_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(imu_rpy_generate_messages imu_rpy_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg/RPY.msg" NAME_WE)
add_dependencies(imu_rpy_generate_messages_lisp _imu_rpy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imu_rpy_genlisp)
add_dependencies(imu_rpy_genlisp imu_rpy_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imu_rpy_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(imu_rpy
  "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg/RPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/imu_rpy
)

### Generating Services

### Generating Module File
_generate_module_nodejs(imu_rpy
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/imu_rpy
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(imu_rpy_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(imu_rpy_generate_messages imu_rpy_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg/RPY.msg" NAME_WE)
add_dependencies(imu_rpy_generate_messages_nodejs _imu_rpy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imu_rpy_gennodejs)
add_dependencies(imu_rpy_gennodejs imu_rpy_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imu_rpy_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(imu_rpy
  "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg/RPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imu_rpy
)

### Generating Services

### Generating Module File
_generate_module_py(imu_rpy
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imu_rpy
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(imu_rpy_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(imu_rpy_generate_messages imu_rpy_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sarrasor/Documents/Projects/Camera_Stabilization/Camera/catkin_ws/src/imu_rpy/msg/RPY.msg" NAME_WE)
add_dependencies(imu_rpy_generate_messages_py _imu_rpy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imu_rpy_genpy)
add_dependencies(imu_rpy_genpy imu_rpy_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imu_rpy_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imu_rpy)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imu_rpy
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(imu_rpy_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imu_rpy)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imu_rpy
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(imu_rpy_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imu_rpy)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imu_rpy
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(imu_rpy_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/imu_rpy)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/imu_rpy
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(imu_rpy_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imu_rpy)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imu_rpy\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imu_rpy
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(imu_rpy_generate_messages_py std_msgs_generate_messages_py)
endif()
