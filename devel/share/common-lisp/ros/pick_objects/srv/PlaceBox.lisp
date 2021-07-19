; Auto-generated. Do not edit!


(cl:in-package pick_objects-srv)


;//! \htmlinclude PlaceBox-request.msg.html

(cl:defclass <PlaceBox-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass PlaceBox-request (<PlaceBox-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlaceBox-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlaceBox-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_objects-srv:<PlaceBox-request> is deprecated: use pick_objects-srv:PlaceBox-request instead.")))

(cl:ensure-generic-function 'linear_x-val :lambda-list '(m))
(cl:defmethod linear_x-val ((m <PlaceBox-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-srv:linear_x-val is deprecated.  Use pick_objects-srv:linear_x instead.")
  (linear_x m))

(cl:ensure-generic-function 'linear_y-val :lambda-list '(m))
(cl:defmethod linear_y-val ((m <PlaceBox-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-srv:linear_y-val is deprecated.  Use pick_objects-srv:linear_y instead.")
  (linear_y m))

(cl:ensure-generic-function 'info-val :lambda-list '(m))
(cl:defmethod info-val ((m <PlaceBox-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-srv:info-val is deprecated.  Use pick_objects-srv:info instead.")
  (info m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlaceBox-request>) ostream)
  "Serializes a message object of type '<PlaceBox-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlaceBox-request>) istream)
  "Deserializes a message object of type '<PlaceBox-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlaceBox-request>)))
  "Returns string type for a service object of type '<PlaceBox-request>"
  "pick_objects/PlaceBoxRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlaceBox-request)))
  "Returns string type for a service object of type 'PlaceBox-request"
  "pick_objects/PlaceBoxRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlaceBox-request>)))
  "Returns md5sum for a message object of type '<PlaceBox-request>"
  "4f4d1ddc81d0c0808876510a339bea29")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlaceBox-request)))
  "Returns md5sum for a message object of type 'PlaceBox-request"
  "4f4d1ddc81d0c0808876510a339bea29")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlaceBox-request>)))
  "Returns full string definition for message of type '<PlaceBox-request>"
  (cl:format cl:nil "~%float64 linear_x~%float64 linear_y~%string info~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlaceBox-request)))
  "Returns full string definition for message of type 'PlaceBox-request"
  (cl:format cl:nil "~%float64 linear_x~%float64 linear_y~%string info~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlaceBox-request>))
  (cl:+ 0
     8
     8
     4 (cl:length (cl:slot-value msg 'info))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlaceBox-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PlaceBox-request
    (cl:cons ':linear_x (linear_x msg))
    (cl:cons ':linear_y (linear_y msg))
    (cl:cons ':info (info msg))
))
;//! \htmlinclude PlaceBox-response.msg.html

(cl:defclass <PlaceBox-response> (roslisp-msg-protocol:ros-message)
  ((rep_info
    :reader rep_info
    :initarg :rep_info
    :type cl:string
    :initform ""))
)

(cl:defclass PlaceBox-response (<PlaceBox-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlaceBox-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlaceBox-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_objects-srv:<PlaceBox-response> is deprecated: use pick_objects-srv:PlaceBox-response instead.")))

(cl:ensure-generic-function 'rep_info-val :lambda-list '(m))
(cl:defmethod rep_info-val ((m <PlaceBox-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-srv:rep_info-val is deprecated.  Use pick_objects-srv:rep_info instead.")
  (rep_info m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlaceBox-response>) ostream)
  "Serializes a message object of type '<PlaceBox-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rep_info))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rep_info))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlaceBox-response>) istream)
  "Deserializes a message object of type '<PlaceBox-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlaceBox-response>)))
  "Returns string type for a service object of type '<PlaceBox-response>"
  "pick_objects/PlaceBoxResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlaceBox-response)))
  "Returns string type for a service object of type 'PlaceBox-response"
  "pick_objects/PlaceBoxResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlaceBox-response>)))
  "Returns md5sum for a message object of type '<PlaceBox-response>"
  "4f4d1ddc81d0c0808876510a339bea29")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlaceBox-response)))
  "Returns md5sum for a message object of type 'PlaceBox-response"
  "4f4d1ddc81d0c0808876510a339bea29")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlaceBox-response>)))
  "Returns full string definition for message of type '<PlaceBox-response>"
  (cl:format cl:nil "~%string rep_info~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlaceBox-response)))
  "Returns full string definition for message of type 'PlaceBox-response"
  (cl:format cl:nil "~%string rep_info~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlaceBox-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'rep_info))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlaceBox-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PlaceBox-response
    (cl:cons ':rep_info (rep_info msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PlaceBox)))
  'PlaceBox-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PlaceBox)))
  'PlaceBox-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlaceBox)))
  "Returns string type for a service object of type '<PlaceBox>"
  "pick_objects/PlaceBox")