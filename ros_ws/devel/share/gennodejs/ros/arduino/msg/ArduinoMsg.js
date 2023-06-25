// Auto-generated. Do not edit!

// (in-package arduino.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ArduinoMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Steering = null;
      this.Throttle = null;
      this.Speed = null;
      this.Mod1 = null;
      this.Mod2 = null;
    }
    else {
      if (initObj.hasOwnProperty('Steering')) {
        this.Steering = initObj.Steering
      }
      else {
        this.Steering = 0.0;
      }
      if (initObj.hasOwnProperty('Throttle')) {
        this.Throttle = initObj.Throttle
      }
      else {
        this.Throttle = 0.0;
      }
      if (initObj.hasOwnProperty('Speed')) {
        this.Speed = initObj.Speed
      }
      else {
        this.Speed = 0.0;
      }
      if (initObj.hasOwnProperty('Mod1')) {
        this.Mod1 = initObj.Mod1
      }
      else {
        this.Mod1 = 0;
      }
      if (initObj.hasOwnProperty('Mod2')) {
        this.Mod2 = initObj.Mod2
      }
      else {
        this.Mod2 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ArduinoMsg
    // Serialize message field [Steering]
    bufferOffset = _serializer.float32(obj.Steering, buffer, bufferOffset);
    // Serialize message field [Throttle]
    bufferOffset = _serializer.float32(obj.Throttle, buffer, bufferOffset);
    // Serialize message field [Speed]
    bufferOffset = _serializer.float32(obj.Speed, buffer, bufferOffset);
    // Serialize message field [Mod1]
    bufferOffset = _serializer.int32(obj.Mod1, buffer, bufferOffset);
    // Serialize message field [Mod2]
    bufferOffset = _serializer.int32(obj.Mod2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ArduinoMsg
    let len;
    let data = new ArduinoMsg(null);
    // Deserialize message field [Steering]
    data.Steering = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Throttle]
    data.Throttle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Speed]
    data.Speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Mod1]
    data.Mod1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Mod2]
    data.Mod2 = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'arduino/ArduinoMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2dd34a0ac459b6a9c29d0a7b4fcad2b7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 Steering
    float32 Throttle
    float32 Speed
    int32 Mod1
    int32 Mod2
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ArduinoMsg(null);
    if (msg.Steering !== undefined) {
      resolved.Steering = msg.Steering;
    }
    else {
      resolved.Steering = 0.0
    }

    if (msg.Throttle !== undefined) {
      resolved.Throttle = msg.Throttle;
    }
    else {
      resolved.Throttle = 0.0
    }

    if (msg.Speed !== undefined) {
      resolved.Speed = msg.Speed;
    }
    else {
      resolved.Speed = 0.0
    }

    if (msg.Mod1 !== undefined) {
      resolved.Mod1 = msg.Mod1;
    }
    else {
      resolved.Mod1 = 0
    }

    if (msg.Mod2 !== undefined) {
      resolved.Mod2 = msg.Mod2;
    }
    else {
      resolved.Mod2 = 0
    }

    return resolved;
    }
};

module.exports = ArduinoMsg;
