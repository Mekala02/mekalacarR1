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

class rc {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Steering = null;
      this.Throttle = null;
      this.Button1 = null;
      this.Button2 = null;
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
      if (initObj.hasOwnProperty('Button1')) {
        this.Button1 = initObj.Button1
      }
      else {
        this.Button1 = 0;
      }
      if (initObj.hasOwnProperty('Button2')) {
        this.Button2 = initObj.Button2
      }
      else {
        this.Button2 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rc
    // Serialize message field [Steering]
    bufferOffset = _serializer.float32(obj.Steering, buffer, bufferOffset);
    // Serialize message field [Throttle]
    bufferOffset = _serializer.float32(obj.Throttle, buffer, bufferOffset);
    // Serialize message field [Button1]
    bufferOffset = _serializer.int32(obj.Button1, buffer, bufferOffset);
    // Serialize message field [Button2]
    bufferOffset = _serializer.int32(obj.Button2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rc
    let len;
    let data = new rc(null);
    // Deserialize message field [Steering]
    data.Steering = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Throttle]
    data.Throttle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Button1]
    data.Button1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Button2]
    data.Button2 = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'arduino/rc';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '85d8f319b6d9e8b597120546faa1bbf9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 Steering
    float32 Throttle
    int32 Button1
    int32 Button2
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rc(null);
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

    if (msg.Button1 !== undefined) {
      resolved.Button1 = msg.Button1;
    }
    else {
      resolved.Button1 = 0
    }

    if (msg.Button2 !== undefined) {
      resolved.Button2 = msg.Button2;
    }
    else {
      resolved.Button2 = 0
    }

    return resolved;
    }
};

module.exports = rc;
