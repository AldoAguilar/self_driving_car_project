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

class ActuatorsData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motor_cnt = null;
      this.servo_cnt = null;
    }
    else {
      if (initObj.hasOwnProperty('motor_cnt')) {
        this.motor_cnt = initObj.motor_cnt
      }
      else {
        this.motor_cnt = 0;
      }
      if (initObj.hasOwnProperty('servo_cnt')) {
        this.servo_cnt = initObj.servo_cnt
      }
      else {
        this.servo_cnt = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ActuatorsData
    // Serialize message field [motor_cnt]
    bufferOffset = _serializer.uint32(obj.motor_cnt, buffer, bufferOffset);
    // Serialize message field [servo_cnt]
    bufferOffset = _serializer.uint32(obj.servo_cnt, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ActuatorsData
    let len;
    let data = new ActuatorsData(null);
    // Deserialize message field [motor_cnt]
    data.motor_cnt = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [servo_cnt]
    data.servo_cnt = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_self_driving_car/ActuatorsData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6b6ed50629e9328ed4596da02266d79d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 motor_cnt
    uint32 servo_cnt
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ActuatorsData(null);
    if (msg.motor_cnt !== undefined) {
      resolved.motor_cnt = msg.motor_cnt;
    }
    else {
      resolved.motor_cnt = 0
    }

    if (msg.servo_cnt !== undefined) {
      resolved.servo_cnt = msg.servo_cnt;
    }
    else {
      resolved.servo_cnt = 0
    }

    return resolved;
    }
};

module.exports = ActuatorsData;
