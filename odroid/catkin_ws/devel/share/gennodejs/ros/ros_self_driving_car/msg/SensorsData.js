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

class SensorsData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.op_mode = null;
      this.speed = null;
      this.angle = null;
      this.motor_cnt = null;
      this.servo_cnt = null;
      this.wheel_1_success = null;
      this.wheel_2_success = null;
      this.wheel_3_success = null;
      this.wheel_4_success = null;
    }
    else {
      if (initObj.hasOwnProperty('op_mode')) {
        this.op_mode = initObj.op_mode
      }
      else {
        this.op_mode = '';
      }
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
      if (initObj.hasOwnProperty('wheel_1_success')) {
        this.wheel_1_success = initObj.wheel_1_success
      }
      else {
        this.wheel_1_success = false;
      }
      if (initObj.hasOwnProperty('wheel_2_success')) {
        this.wheel_2_success = initObj.wheel_2_success
      }
      else {
        this.wheel_2_success = false;
      }
      if (initObj.hasOwnProperty('wheel_3_success')) {
        this.wheel_3_success = initObj.wheel_3_success
      }
      else {
        this.wheel_3_success = false;
      }
      if (initObj.hasOwnProperty('wheel_4_success')) {
        this.wheel_4_success = initObj.wheel_4_success
      }
      else {
        this.wheel_4_success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SensorsData
    // Serialize message field [op_mode]
    bufferOffset = _serializer.string(obj.op_mode, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.uint32(obj.speed, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.uint32(obj.angle, buffer, bufferOffset);
    // Serialize message field [motor_cnt]
    bufferOffset = _serializer.uint32(obj.motor_cnt, buffer, bufferOffset);
    // Serialize message field [servo_cnt]
    bufferOffset = _serializer.uint32(obj.servo_cnt, buffer, bufferOffset);
    // Serialize message field [wheel_1_success]
    bufferOffset = _serializer.bool(obj.wheel_1_success, buffer, bufferOffset);
    // Serialize message field [wheel_2_success]
    bufferOffset = _serializer.bool(obj.wheel_2_success, buffer, bufferOffset);
    // Serialize message field [wheel_3_success]
    bufferOffset = _serializer.bool(obj.wheel_3_success, buffer, bufferOffset);
    // Serialize message field [wheel_4_success]
    bufferOffset = _serializer.bool(obj.wheel_4_success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SensorsData
    let len;
    let data = new SensorsData(null);
    // Deserialize message field [op_mode]
    data.op_mode = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [motor_cnt]
    data.motor_cnt = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [servo_cnt]
    data.servo_cnt = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [wheel_1_success]
    data.wheel_1_success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [wheel_2_success]
    data.wheel_2_success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [wheel_3_success]
    data.wheel_3_success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [wheel_4_success]
    data.wheel_4_success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.op_mode.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_self_driving_car/SensorsData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e00fea77b9600c9d4424dbbf41aef137';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string op_mode
    uint32 speed
    uint32 angle
    uint32 motor_cnt
    uint32 servo_cnt
    bool wheel_1_success
    bool wheel_2_success
    bool wheel_3_success
    bool wheel_4_success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SensorsData(null);
    if (msg.op_mode !== undefined) {
      resolved.op_mode = msg.op_mode;
    }
    else {
      resolved.op_mode = ''
    }

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

    if (msg.wheel_1_success !== undefined) {
      resolved.wheel_1_success = msg.wheel_1_success;
    }
    else {
      resolved.wheel_1_success = false
    }

    if (msg.wheel_2_success !== undefined) {
      resolved.wheel_2_success = msg.wheel_2_success;
    }
    else {
      resolved.wheel_2_success = false
    }

    if (msg.wheel_3_success !== undefined) {
      resolved.wheel_3_success = msg.wheel_3_success;
    }
    else {
      resolved.wheel_3_success = false
    }

    if (msg.wheel_4_success !== undefined) {
      resolved.wheel_4_success = msg.wheel_4_success;
    }
    else {
      resolved.wheel_4_success = false
    }

    return resolved;
    }
};

module.exports = SensorsData;
