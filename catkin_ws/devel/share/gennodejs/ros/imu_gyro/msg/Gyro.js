// Auto-generated. Do not edit!

// (in-package imu_gyro.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Gyro {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rpsX = null;
      this.rpsY = null;
      this.rpsZ = null;
    }
    else {
      if (initObj.hasOwnProperty('rpsX')) {
        this.rpsX = initObj.rpsX
      }
      else {
        this.rpsX = 0.0;
      }
      if (initObj.hasOwnProperty('rpsY')) {
        this.rpsY = initObj.rpsY
      }
      else {
        this.rpsY = 0.0;
      }
      if (initObj.hasOwnProperty('rpsZ')) {
        this.rpsZ = initObj.rpsZ
      }
      else {
        this.rpsZ = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Gyro
    // Serialize message field [rpsX]
    bufferOffset = _serializer.float32(obj.rpsX, buffer, bufferOffset);
    // Serialize message field [rpsY]
    bufferOffset = _serializer.float32(obj.rpsY, buffer, bufferOffset);
    // Serialize message field [rpsZ]
    bufferOffset = _serializer.float32(obj.rpsZ, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Gyro
    let len;
    let data = new Gyro(null);
    // Deserialize message field [rpsX]
    data.rpsX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rpsY]
    data.rpsY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rpsZ]
    data.rpsZ = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'imu_gyro/Gyro';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '03288a553ea1034d214a7713078c4a04';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 rpsX
    float32 rpsY
    float32 rpsZ
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Gyro(null);
    if (msg.rpsX !== undefined) {
      resolved.rpsX = msg.rpsX;
    }
    else {
      resolved.rpsX = 0.0
    }

    if (msg.rpsY !== undefined) {
      resolved.rpsY = msg.rpsY;
    }
    else {
      resolved.rpsY = 0.0
    }

    if (msg.rpsZ !== undefined) {
      resolved.rpsZ = msg.rpsZ;
    }
    else {
      resolved.rpsZ = 0.0
    }

    return resolved;
    }
};

module.exports = Gyro;
