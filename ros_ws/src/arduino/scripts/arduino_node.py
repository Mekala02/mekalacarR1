#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from arduino.msg import ArduinoMsg
from common.common_functions import PID, Limiter, pwm2float, float2pwm

import serial
import time
import re

class Arduino:
    def __init__(self):
        self.outputs = {"Steering": 0, "Throttle": 0, "Speed": 0, "Mode1": 0, "Mode2": 0, "Target_Speed": None}
        # Also It can output Act_Value, Record and drive mode acoording to mode button
        # self.act_value_type = memory.cfg["ACT_VALUE_TYPE"]
        self.act_value_type = rospy.get_param("ACT_VALUE_TYPE")
        self.Steering_A = 1500
        self.Act_Value_A = 1500
        self.Speed_A = 0
        self.Mode1 = 0
        self.Mode2 = 0
        self.Steering = 0
        self.Act_Value = 0
        self.Speed = 0
        self.Throttle = 0
        self.ticks_per_unit = rospy.get_param("ENCODER_TICKS_PER_UNIT")
        self.stick_multiplier = rospy.get_param("TRANSMITTER_STICK_SPEED_MULTIPLIER")
        self.steering_limiter = Limiter(
            min_=pwm2float(rospy.get_param("STEERING_MIN_PWM")),
            max_=pwm2float(rospy.get_param("STEERING_MAX_PWM"))
        )
        self.throttle_limiter = Limiter(
            min_=pwm2float(rospy.get_param("THROTTLE_MIN_PWM")),
            max_=pwm2float(rospy.get_param("THROTTLE_MAX_PWM"))
        )
        if self.act_value_type == "Speed":
            self.Target_Speed = 0
            self.pid = PID(
                Kp=rospy.get_param("K_PID")["Kp"],
                Ki=rospy.get_param("K_PID")["Ki"],
                Kd=rospy.get_param("K_PID")["Kd"],
                I_max=rospy.get_param("K_PID")["I_max"]
            )

        self.arduino = serial.Serial(port='/dev/ttyUSB0', baudrate=115200, timeout=0.006, write_timeout=0.006)
        time.sleep(0.04)

        rospy.init_node("arduino", anonymous=True)
        self.fpub = rospy.Publisher("arduino", ArduinoMsg, queue_size=10)
        self.rate = rospy.Rate(120)
        rospy.loginfo("Arduino Successfully Added")

    def grab_data(self):
        buffer = False
        try: buffer = self.arduino.read(self.arduino.in_waiting).decode('utf-8') 
        except Exception as e: pass
        # Looking if data is right format
        if buffer and buffer[0] == "s":
            # re.search(r"t\d+.\d+s\d+.\d+v\d+.\d+e", data) // todo
            data_array = re.split(r's|t|m|m|v|e', buffer)
            self.Steering_A = int(data_array[1])
            self.Act_Value_A = int(data_array[2])
            # if 0 --> radio turned off, elif 1 --> mode 1, elif 2 --> mode 2
            self.Mode1 = int(data_array[3])
            self.Mode2 = int(data_array[4])
            self.Speed_A = float(data_array[5])

    def start_thread(self):
        rospy.loginfo("Arduino Node Starting")
        while not rospy.is_shutdown():
            self.grab_data()
            self.update()
            self.rate.sleep()
        arduino.shut_down()

    def update(self):
        '''
        We want to send the data as fast as we can so we are only sending 2 int as string, those
        strings encode motor power and drive mode parameters to throttle and steering values
        If char is between 1000, 2000 arduino will use that value to drive motors
        If char is = 0 arduino won't use that value for controlling the actuator
        '''
        # # Speed_A is ticks/sec we converting it to unit/sec
        # self.Speed = self.Speed_A / self.ticks_per_unit
        # pilot_mode_string = "Manuel"
        # # pilot_mode_string = self.memory.memory["Pilot_Mode"]
        # self.Act_Value = pwm2float(self.Act_Value_A)
        # if pilot_mode_string == "Full_Auto":
        #     Steering_Signal = float2pwm(-self.memory.memory["Steering"])
        #     Throttle_Signal = float2pwm(self.memory.memory["Throttle"] * self.memory.memory["Motor_Power"])
        # elif pilot_mode_string == "Manuel" or pilot_mode_string == "Angle":
        #     if self.act_value_type == "Throttle":
        #         self.Throttle = self.Act_Value
        #         Throttle_Signal = 0
        #     elif self.act_value_type == "Speed":
        #         self.Target_Speed = self.stick_multiplier * self.Act_Value
        #         self.Throttle = self.throttle_limiter(self.pid(self.Speed, self.Target_Speed))
        #         Throttle_Signal = float2pwm(self.Throttle)
        #         self.memory.memory["Target_Speed"] = self.Target_Speed
        #     self.memory.memory["Throttle"] = self.Throttle
        #     if pilot_mode_string == "Manuel":
        #         self.Steering = -pwm2float(self.Steering_A)
        #         self.memory.memory["Steering"] = self.Steering
        #         Steering_Signal = 0
        #     if pilot_mode_string == "Angle":
        #         Steering_Signal = float2pwm(-self.memory.memory["Steering"])

        Steering_Signal = 0
        Throttle_Signal = 0
        self.Steering = -pwm2float(self.Steering_A)
        self.Throttle = pwm2float(self.Act_Value_A)

        msg = ArduinoMsg()
        msg.Steering = self.Steering
        msg.Throttle = self.Throttle
        msg.Speed = self.Speed
        msg.Mod1 = self.Mode1
        msg.Mod2 = self.Mode2
        self.fpub.publish(msg)

        # s is for stating start of steering value t is for throttle and e is for end, \r for read ending
        formatted_data = "s" + str(Steering_Signal) + "t" + str(Throttle_Signal) + 'e' + '\r'
        try: self.arduino.write(formatted_data.encode())
        except Exception as e: pass # rospy.logwarn(e)
        else: pass # rospy.loginfo("Succes !!!")

    def shut_down(self):
        # If we reading from arduino and close the port that
        # will cause error so we waiting to finish reading then close
        time.sleep(0.05)
        self.arduino.close()
        rospy.loginfo("Arduino Node Stopped")

if __name__ == "__main__":
    arduino = Arduino()      
    try:
        arduino.start_thread()
    except rospy.ROSInitException:
        arduino.shut_down()