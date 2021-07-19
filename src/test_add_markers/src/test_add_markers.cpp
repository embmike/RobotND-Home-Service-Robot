#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <string>

struct MarkerPose
{
  float x;
  float y;
  std::string zone;
};

class Marker
{
private:
  ros::NodeHandle n;
  ros::Rate r{1};
  ros::Publisher marker_pub {n.advertise<visualization_msgs::Marker>("visualization_marker", 1)};
  uint32_t shape {visualization_msgs::Marker::CUBE}; // Set our initial shape type to be a cube
  visualization_msgs::Marker marker;

public:
  Marker()
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

  void Put(MarkerPose marker_pose, float pause)
  {
    // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
    marker.action = visualization_msgs::Marker::ADD;

    marker.pose.position.x = marker_pose.x;
    marker.pose.position.y = marker_pose.y;

    marker_pub.publish(marker);
    ROS_INFO("The marker is in the %s zone.", marker_pose.zone.c_str());
 
    ros::Duration(pause).sleep();
  }

  void Remove(MarkerPose marker_pose, float pause)
  {
    // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
    marker.action = visualization_msgs::Marker::DELETE;

    marker.pose.position.x = marker_pose.x;
    marker.pose.position.y = marker_pose.y;

    marker_pub.publish(marker);
    ROS_INFO("The marker has been removed from the %s zone.", marker_pose.zone.c_str());

    ros::Duration(pause).sleep();
  }

  void Move(MarkerPose pick_up, MarkerPose drop_off, float move)
  {
    // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
    marker.action = visualization_msgs::Marker::DELETE;

    marker.pose.position.x = pick_up.x;
    marker.pose.position.y = pick_up.y;

    marker_pub.publish(marker);
    ROS_INFO("The marker moves away from the %s zone.", pick_up.zone.c_str());

    //Moving
    ros::Duration(move).sleep();

    // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
    marker.action = visualization_msgs::Marker::ADD;

    marker.pose.position.x = drop_off.x;
    marker.pose.position.y = drop_off.y;

    marker_pub.publish(marker);
    ROS_INFO("The marker is in the %s zone.", drop_off.zone.c_str());
  }

};



int main( int argc, char** argv )
{
  ros::init(argc, argv, "add_markers");

  Marker marker;
  MarkerPose pick_up_pose  {-5.56, -5.89, "pick-up"};
  MarkerPose drop_off_pose {-5.06, 1.96, "drop-off"};

  // Put the marker in the pick-up zone and wait 5 sec. 
  marker.Put(pick_up_pose, 5.0 /* sec */);

  // Move the marker from the pick-up zone to the drop-off zone for 5 sec.
  marker.Move(pick_up_pose, drop_off_pose, 5.0 /* sec */);

  // Handle ROS communication events
  ros::spin();

  return 0;
}

