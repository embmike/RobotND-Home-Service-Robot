#!/bin/sh

# Application setup:
# Moves the robot into the pick-up zone and then into the drop-off zone.

xterm -e " cd $(pwd)/../../;source devel/setup.bash;
roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=$(pwd)/../map/home_service.world " &

sleep 5
xterm -e " cd $(pwd)/../../;source devel/setup.bash;
roslaunch turtlebot_gazebo amcl_demo.launch map_file:=$(pwd)/../map/home_service.yaml initial_pose_a:=-1.76 " &

sleep 5
xterm -e " cd $(pwd)/../../;source devel/setup.bash;
roslaunch test_pick_objects home_service_robot.launch rviz_config_file:=$(pwd)/../rviz_config/home_service_nav.rviz " &

sleep 10
xterm -e " cd $(pwd)/../../;source devel/setup.bash;
rosrun test_pick_objects test_pick_objects "

