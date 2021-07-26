#define MESSAGE_BUILD 1
#if MESSAGE_BUILD > 0 // Hack when devel deleted! 0: first catkin_make messages, 1: second catkin_make sources

#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include "pick_objects/PlaceBox.h"
#include "pick_objects/RemoveBox.h"
#include <string>

// Define a client for to send goal requests to the move_base server through a SimpleActionClient
using MoveBaseClient = actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction>;

enum struct RobotMission : unsigned int
{
    DROP_OFF = 0,
    PICK_UP  = 1,
};

struct RobotPose
{
  float x;
  float y;
  float w;
  RobotMission mission;
  std::string zone;
};

class DeliveryRobot final
{
private:
  //tell the action client that we want to spin a thread by default
  MoveBaseClient ac {"move_base", true};
  ros::NodeHandle n;
  ros::ServiceClient client_place_box {n.serviceClient<pick_objects::PlaceBox>("/pick_objects/command_place_box")};
  ros::ServiceClient client_remove_box {n.serviceClient<pick_objects::RemoveBox>("/pick_objects/command_remove_box")};

public:
  DeliveryRobot()
  {
    // Wait 5 sec for move_base action server to come up
    while( !ac.waitForServer(ros::Duration(5.0)) )
    {
      ROS_INFO("Waiting for the move_base action server to come up.");
    }
  }

  const DeliveryRobot& DriveTo(RobotPose pose)
  {
    if( pose.mission == RobotMission::PICK_UP)
    {
      // Request place box
      pick_objects::PlaceBox srv;
      srv.request.linear_x      = pose.x;
      srv.request.linear_y      = pose.y;
      srv.request.info          = "The marker is in the " +  pose.zone + " zone.";

      if( client_place_box.call(srv) == false )
      {
        ROS_ERROR("Failed to call client.");
      }
    }

    // Moving
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

      if( pose.mission == RobotMission::PICK_UP)
      {
        // Request remove box
        pick_objects::RemoveBox srv;
        srv.request.linear_x      = pose.x;
        srv.request.linear_y      = pose.y;
        srv.request.info          = "The marker has been removed from the " + pose.zone + " zone.";

        if( client_remove_box.call(srv) == false )
        {
          ROS_ERROR("Failed to call client");
        }
      }
      else if( pose.mission == RobotMission::DROP_OFF )
      {
        // Request place box
        pick_objects::PlaceBox srv;
        srv.request.linear_x      = pose.x;
        srv.request.linear_y      = pose.y;
        srv.request.info          = "The marker is in the " + pose.zone + " zone.";

        if( client_place_box.call(srv) == false )
        {
          ROS_ERROR("Failed to call client.");
        }
      }

    }
    else
    {
      ROS_INFO("The bot failed to reach the %s zone.", pose.zone.c_str());  
    }

    return *this;
  }

  void PauseFor(const float pause ) const
  {
    ros::Duration(pause).sleep();
  }
  
};


int main(int argc, char** argv)
{
  // Pauses of the robot
  constexpr float pause_1_sec {1.0};
  constexpr float pause_5_sec {5.0};

  // Initialize the pick_objects node
  ros::init(argc, argv, "pick_objects");

  // The delivery robot is ready to work :-)
  DeliveryRobot robot;

  // The robot poses
  RobotPose pick_up_pose  {-5.56, -5.89, -0.43, RobotMission::PICK_UP,  "pick-up"};
  RobotPose drop_off_pose {-5.06,  1.96, -0.43, RobotMission::DROP_OFF, "drop-off"};

  // Drive bot to the first station to pick an object and pause 5 sec
  robot.DriveTo(pick_up_pose).PauseFor(pause_5_sec);

  // Drive the bot to the second station to drop off the object and pause 1 sec
  robot.DriveTo(drop_off_pose).PauseFor(pause_1_sec);

  // Rpbot message
  ROS_INFO("Robot: 'I need a pause. My battery is drained out. :-( '");

  // Handle ROS communication events
  ros::spin();

  return 0;
}


#else
#include <ros/ros.h>
int main( int argc, char** argv )
{
  return 0;
}
#endif
