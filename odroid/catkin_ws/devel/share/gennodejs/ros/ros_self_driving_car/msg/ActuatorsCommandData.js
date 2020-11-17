// Auto-generated. Do not edit!

// (in-package ros_self_driving_car.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ActuatorsCommandData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.speed = null;
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0;
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ActuatorsCommandData
    // Serialize message field [speed]
    bufferOffset = _serializer.uint32(obj.speed, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.uint32(obj.angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ActuatorsCommandData
    let len;
    let data = new ActuatorsCommandData(null);
    // Deserialize message field [speed]
    data.speed = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_self_driving_car/ActuatorsCommandData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9caa6924c81cdc9852d0edbb4d6db3f1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 speed
    uint32 angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ActuatorsCommandData(null);
    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0
    }

    return resolved;
    }
};

module.exports = ActuatorsCommandData;
