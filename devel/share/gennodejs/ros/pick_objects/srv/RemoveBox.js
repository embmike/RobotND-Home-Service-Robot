// Auto-generated. Do not edit!

// (in-package pick_objects.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class RemoveBoxRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.linear_x = null;
      this.linear_y = null;
      this.info = null;
    }
    else {
      if (initObj.hasOwnProperty('linear_x')) {
        this.linear_x = initObj.linear_x
      }
      else {
        this.linear_x = 0.0;
      }
      if (initObj.hasOwnProperty('linear_y')) {
        this.linear_y = initObj.linear_y
      }
      else {
        this.linear_y = 0.0;
      }
      if (initObj.hasOwnProperty('info')) {
        this.info = initObj.info
      }
      else {
        this.info = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RemoveBoxRequest
    // Serialize message field [linear_x]
    bufferOffset = _serializer.float64(obj.linear_x, buffer, bufferOffset);
    // Serialize message field [linear_y]
    bufferOffset = _serializer.float64(obj.linear_y, buffer, bufferOffset);
    // Serialize message field [info]
    bufferOffset = _serializer.string(obj.info, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RemoveBoxRequest
    let len;
    let data = new RemoveBoxRequest(null);
    // Deserialize message field [linear_x]
    data.linear_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [linear_y]
    data.linear_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [info]
    data.info = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.info.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pick_objects/RemoveBoxRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '70778ab58c223b3cc4d6daa5b18bec49';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    float64 linear_x
    float64 linear_y
    string info
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RemoveBoxRequest(null);
    if (msg.linear_x !== undefined) {
      resolved.linear_x = msg.linear_x;
    }
    else {
      resolved.linear_x = 0.0
    }

    if (msg.linear_y !== undefined) {
      resolved.linear_y = msg.linear_y;
    }
    else {
      resolved.linear_y = 0.0
    }

    if (msg.info !== undefined) {
      resolved.info = msg.info;
    }
    else {
      resolved.info = ''
    }

    return resolved;
    }
};

class RemoveBoxResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rep_info = null;
    }
    else {
      if (initObj.hasOwnProperty('rep_info')) {
        this.rep_info = initObj.rep_info
      }
      else {
        this.rep_info = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RemoveBoxResponse
    // Serialize message field [rep_info]
    bufferOffset = _serializer.string(obj.rep_info, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RemoveBoxResponse
    let len;
    let data = new RemoveBoxResponse(null);
    // Deserialize message field [rep_info]
    data.rep_info = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.rep_info.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pick_objects/RemoveBoxResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9c052bddbf855bdd6b0c6aa0a0c252c2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    string rep_info
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RemoveBoxResponse(null);
    if (msg.rep_info !== undefined) {
      resolved.rep_info = msg.rep_info;
    }
    else {
      resolved.rep_info = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: RemoveBoxRequest,
  Response: RemoveBoxResponse,
  md5sum() { return '4f4d1ddc81d0c0808876510a339bea29'; },
  datatype() { return 'pick_objects/RemoveBox'; }
};
