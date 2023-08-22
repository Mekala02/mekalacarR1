cmake_minimum_required(VERSION 2.8.3)

project(description)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  sensor_msgs
  arduino
)

catkin_package()

find_package(roslaunch)

catkin_install_python(PROGRAMS
  scripts/joint_state_publisher.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

foreach(dir config launch meshes urdf)
	install(DIRECTORY ${dir}/
		DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/${dir})
endforeach(dir)
