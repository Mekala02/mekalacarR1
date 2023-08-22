#!/usr/bin/env python
import rospy
from sensor_msgs.msg import JointState
from arduino.msg import rc

import time

class Joint_State_Publisher:
    def __init__(self):
        self.j_steering_f_r = 0
        self.j_tire_f_r = 0
        self.j_tire_r_r = 0
        self.j_steering_f_l = 0
        self.j_tire_f_l = 0
        self.j_tire_r_l = 0

        rospy.init_node("joint_states", anonymous=True)
        self.joint_state_pub = rospy.Publisher("joint_states", JointState, queue_size=10)
        self.rate = rospy.Rate(10)

        rospy.Subscriber("rc", rc, self.grab_data)

        rospy.loginfo("Joint State Publisher Successfully Added")

    def grab_data(self, data):
        self.j_steering_f_r = data.Steering
        self.j_tire_f_r = 0
        self.j_tire_r_r = 0
        self.j_steering_f_l = data.Steering
        self.j_tire_f_l = 0
        self.j_tire_r_l = 0

    def start_thread(self):
        rospy.loginfo("Joint State Publisher Starting")
        while not rospy.is_shutdown():
            # self.grab_data()
            self.update()
            self.rate.sleep()
        jsp.shut_down()

    def update(self):
        msg = JointState()
        msg.header.stamp = rospy.Time.now()

        msg.name = ["j_steering_f_r", "j_tire_f_r", "j_tire_r_r", "j_steering_f_l", "j_tire_f_l", "j_tire_r_l"]
        msg.position = [
            self.j_steering_f_r,
            self.j_tire_f_r,
            self.j_tire_r_r,
            self.j_steering_f_l,
            self.j_tire_f_l,
            self.j_tire_r_l
        ]
        msg.velocity = []
        msg.effort = []

        self.joint_state_pub.publish(msg)

    def shut_down(self):
        # If we reading from arduino and close the port that
        # will cause error so we waiting to finish reading then close
        time.sleep(0.05)
        rospy.loginfo("Joint State Publisher Node Stopped")

if __name__ == "__main__":
    jsp = Joint_State_Publisher()      
    try:
        jsp.start_thread()
    except rospy.ROSInitException:
        jsp.shut_down()