#!/bin/sh

# Application setup:
# Moves the robot into the pick-up zone and then into the drop-off zone.
# Show marker on pick-up zone and drop-off zone.

xterm -e " cd $(pwd)/../../;source devel/setup.bash;
roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=$(pwd)/../map/home_service.world " &

sleep 5
xterm -e " cd $(pwd)/../../;source devel/setup.bash;
roslaunch turtlebot_gazebo amcl_demo.launch map_file:=$(pwd)/../map/home_service.yaml initial_pose_a:=-1.76 " &

sleep 5
xterm -e " cd $(pwd)/../../;source devel/setup.bash;
roslaunch add_markers home_service_robot.launch rviz_config_file:=$(pwd)/../rviz_config/home_service_nav.rviz " &

sleep 15
xterm -e " cd $(pwd)/../../;source devel/setup.bash;
rosrun add_markers add_markers " &

sleep 3
xterm -e " cd $(pwd)/../../;source devel/setup.bash;
rosrun pick_objects pick_objects "

