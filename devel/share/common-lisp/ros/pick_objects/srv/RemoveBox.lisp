; Auto-generated. Do not edit!


(cl:in-package pick_objects-srv)


;//! \htmlinclude RemoveBox-request.msg.html

(cl:defclass <RemoveBox-request> (roslisp-msg-protocol:ros-message)
  ((linear_x
    :reader linear_x
    :initarg :linear_x
    :type cl:float
    :initform 0.0)
   (linear_y
    :reader linear_y
    :initarg :linear_y
    :type cl:float
    :initform 0.0)
   (info
    :reader info
    :initarg :info
    :type cl:string
    :initform ""))
)

(cl:defclass RemoveBox-request (<RemoveBox-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RemoveBox-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RemoveBox-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_objects-srv:<RemoveBox-request> is deprecated: use pick_objects-srv:RemoveBox-request instead.")))

(cl:ensure-generic-function 'linear_x-val :lambda-list '(m))
(cl:defmethod linear_x-val ((m <RemoveBox-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-srv:linear_x-val is deprecated.  Use pick_objects-srv:linear_x instead.")
  (linear_x m))

(cl:ensure-generic-function 'linear_y-val :lambda-list '(m))
(cl:defmethod linear_y-val ((m <RemoveBox-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-srv:linear_y-val is deprecated.  Use pick_objects-srv:linear_y instead.")
  (linear_y m))

(cl:ensure-generic-function 'info-val :lambda-list '(m))
(cl:defmethod info-val ((m <RemoveBox-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-srv:info-val is deprecated.  Use pick_objects-srv:info instead.")
  (info m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RemoveBox-request>) ostream)
  "Serializes a message object of type '<RemoveBox-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'linear_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'linear_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'info))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'info))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RemoveBox-request>) istream)
  "Deserializes a message object of type '<RemoveBox-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'info) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'info) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RemoveBox-request>)))
  "Returns string type for a service object of type '<RemoveBox-request>"
  "pick_objects/RemoveBoxRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RemoveBox-request)))
  "Returns string type for a service object of type 'RemoveBox-request"
  "pick_objects/RemoveBoxRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RemoveBox-request>)))
  "Returns md5sum for a message object of type '<RemoveBox-request>"
  "4f4d1ddc81d0c0808876510a339bea29")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RemoveBox-request)))
  "Returns md5sum for a message object of type 'RemoveBox-request"
  "4f4d1ddc81d0c0808876510a339bea29")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RemoveBox-request>)))
  "Returns full string definition for message of type '<RemoveBox-request>"
  (cl:format cl:nil "~%float64 linear_x~%float64 linear_y~%string info~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RemoveBox-request)))
  "Returns full string definition for message of type 'RemoveBox-request"
  (cl:format cl:nil "~%float64 linear_x~%float64 linear_y~%string info~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RemoveBox-request>))
  (cl:+ 0
     8
     8
     4 (cl:length (cl:slot-value msg 'info))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RemoveBox-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RemoveBox-request
    (cl:cons ':linear_x (linear_x msg))
    (cl:cons ':linear_y (linear_y msg))
    (cl:cons ':info (info msg))
))
;//! \htmlinclude RemoveBox-response.msg.html

(cl:defclass <RemoveBox-response> (roslisp-msg-protocol:ros-message)
  ((rep_info
    :reader rep_info
    :initarg :rep_info
    :type cl:string
    :initform ""))
)

(cl:defclass RemoveBox-response (<RemoveBox-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RemoveBox-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RemoveBox-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_objects-srv:<RemoveBox-response> is deprecated: use pick_objects-srv:RemoveBox-response instead.")))

(cl:ensure-generic-function 'rep_info-val :lambda-list '(m))
(cl:defmethod rep_info-val ((m <RemoveBox-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-srv:rep_info-val is deprecated.  Use pick_objects-srv:rep_info instead.")
  (rep_info m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RemoveBox-response>) ostream)
  "Serializes a message object of type '<RemoveBox-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rep_info))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rep_info))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RemoveBox-response>) istream)
  "Deserializes a message object of type '<RemoveBox-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rep_info) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rep_info) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RemoveBox-response>)))
  "Returns string type for a service object of type '<RemoveBox-response>"
  "pick_objects/RemoveBoxResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RemoveBox-response)))
  "Returns string type for a service object of type 'RemoveBox-response"
  "pick_objects/RemoveBoxResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RemoveBox-response>)))
  "Returns md5sum for a message object of type '<RemoveBox-response>"
  "4f4d1ddc81d0c0808876510a339bea29")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RemoveBox-response)))
  "Returns md5sum for a message object of type 'RemoveBox-response"
  "4f4d1ddc81d0c0808876510a339bea29")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RemoveBox-response>)))
  "Returns full string definition for message of type '<RemoveBox-response>"
  (cl:format cl:nil "~%string rep_info~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RemoveBox-response)))
  "Returns full string definition for message of type 'RemoveBox-response"
  (cl:format cl:nil "~%string rep_info~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RemoveBox-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'rep_info))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RemoveBox-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RemoveBox-response
    (cl:cons ':rep_info (rep_info msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RemoveBox)))
  'RemoveBox-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RemoveBox)))
  'RemoveBox-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RemoveBox)))
  "Returns string type for a service object of type '<RemoveBox>"
  "pick_objects/RemoveBox")