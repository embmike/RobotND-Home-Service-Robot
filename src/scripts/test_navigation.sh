#!/bin/sh

# Test navigation

xterm -e " cd $(pwd)/../../;source devel/setup.bash;
roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=$(pwd)/../map/home_service.world " &

sleep 5
xterm -e " cd $(pwd)/../../;source devel/setup.bash;
roslaunch turtlebot_gazebo amcl_demo.launch map_file:=$(pwd)/../map/home_service.yaml initial_pose_a:=-1.76 " &

sleep 5
xterm -e " cd $(pwd)/../../;source devel/setup.bash;
roslaunch turtlebot_rviz_launchers view_navigation.launch "
