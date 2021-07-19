#define MESSAGE_BUILD 1
#if MESSAGE_BUILD > 0 // Hack when devel deleted! 0: first catkin_make messages, 1: second catkin_make sources

#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
// #include <nav_msgs/Odometry.h>
#include "pick_objects/PlaceBox.h"
#include "pick_objects/RemoveBox.h"
#include <string>

using PlaceBoxReq = pick_objects::PlaceBox::Request;
using RemoveBoxReq = pick_objects::RemoveBox::Request;

using PlaceBoxRes = pick_objects::PlaceBox::Response;
using RemoveBoxRes = pick_objects::RemoveBox::Response;

class MarkerVisu
{
private:
  ros::NodeHandle n;
  ros::Rate r{1};
  ros::Publisher marker_pub {n.advertise<visualization_msgs::Marker>("visualization_marker", 1)};
  ros::ServiceServer service_place_box {n.advertiseService("/pick_objects/command_place_box", &MarkerVisu::Put, this)};
  ros::ServiceServer service_remove_box {n.advertiseService("/pick_objects/command_remove_box", &MarkerVisu::Remove, this)};
  uint32_t shape {visualization_msgs::Marker::CUBE}; // Set our initial shape type to be a cube
  visualization_msgs::Marker marker;

public:
  MarkerVisu()
  {
    // Set the frame ID and timestamp.  See the TF tutorials for information on these.
    marker.header.frame_id = "/map";
    marker.header.stamp = ros::Time::now();

    // Set the namespace and id for this marker.  This serves to create a unique ID
    // Any marker sent with the same namespace and id will overwrite the old one
    marker.ns = "basic_shapes";
    marker.id = 0;

    // Set the marker type.  Initially this is CUBE, and cycles between that and SPHERE, ARROW, and CYLINDER
    marker.type = shape;

    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
    marker.pose.position.x = 0;
    marker.pose.position.y = 0;
    marker.pose.position.z = 0;
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;

    // Set the scale of the marker -- 1x1x1 here means 1m on a side
    marker.scale.x = 0.5;
    marker.scale.y = 0.5;
    marker.scale.z = 0.5;

    // Set the color -- be sure to set alpha to something non-zero!
    marker.color.r = 0.0f;
    marker.color.g = 1.0f;
    marker.color.b = 0.0f;
    marker.color.a = 1.0;

    marker.lifetime = ros::Duration();

    while(marker_pub.getNumSubscribers() == 0 || !ros::ok())
    {
      ROS_WARN_ONCE("Wait for a subscriber to the marker");
    }
    
    ROS_INFO("The marker has a subscriber. ");
  }

  bool Put(PlaceBoxReq& req, PlaceBoxRes& res)
  {
    marker.action = visualization_msgs::Marker::ADD;

    marker.pose.position.x = req.linear_x;
    marker.pose.position.y = req.linear_y;

    marker_pub.publish(marker);
    ROS_INFO("%s", req.info.c_str());

    return true;
  }

  bool Remove(RemoveBoxReq& req, RemoveBoxRes& res)
  {
    marker.action = visualization_msgs::Marker::DELETE;

    marker.pose.position.x = req.linear_x;
    marker.pose.position.y = req.linear_y;

    marker_pub.publish(marker);
    ROS_INFO("%s", req.info.c_str());

    return true;

  }
  
};


int main( int argc, char** argv )
{
  ros::init(argc, argv, "add_markers");

  // The Marker for the robot
  MarkerVisu marker;

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
