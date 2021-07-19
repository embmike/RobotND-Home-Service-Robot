#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <string>

// Define a client for to send goal requests to the move_base server through a SimpleActionClient
using MoveBaseClient = actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction>;

struct RobotPose
{
  float x;
  float y;
  float w;
  std::string zone;
};

class DeliveryRobot final
{
private:
  //tell the action client that we want to spin a thread by default
  MoveBaseClient ac {"move_base", true};


public:
  DeliveryRobot()
  {
    // Wait 5 sec for move_base action server to come up
    while( !ac.waitForServer(ros::Duration(5.0)) )
    {
      ROS_INFO("Waiting for the move_base action server to come up");
    }
  }

  void DriveTo(RobotPose pose, float pause)
  {
    move_base_msgs::MoveBaseGoal goal;

    // set up the frame parameters
    goal.target_pose.header.frame_id = "map";
    goal.target_pose.header.stamp = ros::Time::now();

    // Define a position and orientation for the robot to reach
    goal.target_pose.pose.position.x = pose.x;
    goal.target_pose.pose.position.y = pose.y;
    goal.target_pose.pose.orientation.w = pose.w;

    // Send the goal position and orientation for the robot to reach
    ROS_INFO("Sending goal");
    ac.sendGoal(goal);

    // Wait an infinite time for the results
    ac.waitForResult();

    // Check if the robot reached its goal
    if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
    {
      ROS_INFO("The bot reached the %s zone.", pose.zone.c_str());
    }
    else
    {
      ROS_INFO("The bot failed to reach the %s zone.", pose.zone.c_str());  
    }

    ros::Duration(pause).sleep();
  }
  
};

int main(int argc, char** argv)
{
  // Initialize the pick_objects node
  ros::init(argc, argv, "pick_objects");

  // the pick-bot
  DeliveryRobot robot;

  // The poses
  RobotPose pick_up_pose  {-5.56, -5.89, -0.43, "pick-up"};
  RobotPose drop_off_pose {-5.06, 1.96, -0.43, "drop-off"};

  // Drive bot to the first station to pick an object and pause 5 sec
  robot.DriveTo(pick_up_pose, 5.0);

  // Drive the bot to the second station to drop off the object and pause 1 sec
  robot.DriveTo(drop_off_pose, 1.0);

  // Rpbot message
  ROS_INFO("Robot: 'I need a pause. My battery is drained out. :-( '");

  // Handle ROS communication events
  ros::spin();

  return 0;
}
