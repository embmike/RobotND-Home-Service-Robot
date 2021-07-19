;; Auto-generated. Do not edit!


(when (boundp 'pick_objects::RemoveBox)
  (if (not (find-package "PICK_OBJECTS"))
    (make-package "PICK_OBJECTS"))
  (shadow 'RemoveBox (find-package "PICK_OBJECTS")))
(unless (find-package "PICK_OBJECTS::REMOVEBOX")
  (make-package "PICK_OBJECTS::REMOVEBOX"))
(unless (find-package "PICK_OBJECTS::REMOVEBOXREQUEST")
  (make-package "PICK_OBJECTS::REMOVEBOXREQUEST"))
(unless (find-package "PICK_OBJECTS::REMOVEBOXRESPONSE")
  (make-package "PICK_OBJECTS::REMOVEBOXRESPONSE"))

(in-package "ROS")





(defclass pick_objects::RemoveBoxRequest
  :super ros::object
  :slots (_linear_x _linear_y _info ))

(defmethod pick_objects::RemoveBoxRequest
  (:init
   (&key
    ((:linear_x __linear_x) 0.0)
    ((:linear_y __linear_y) 0.0)
    ((:info __info) "")
    )
   (send-super :init)
   (setq _linear_x (float __linear_x))
   (setq _linear_y (float __linear_y))
   (setq _info (string __info))
   self)
  (:linear_x
   (&optional __linear_x)
   (if __linear_x (setq _linear_x __linear_x)) _linear_x)
  (:linear_y
   (&optional __linear_y)
   (if __linear_y (setq _linear_y __linear_y)) _linear_y)
  (:info
   (&optional __info)
   (if __info (setq _info __info)) _info)
  (:serialization-length
   ()
   (+
    ;; float64 _linear_x
    8
    ;; float64 _linear_y
    8
    ;; string _info
    4 (length _info)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _linear_x
       (sys::poke _linear_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _linear_y
       (sys::poke _linear_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _info
       (write-long (length _info) s) (princ _info s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _linear_x
     (setq _linear_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _linear_y
     (setq _linear_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _info
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _info (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass pick_objects::RemoveBoxResponse
  :super ros::object
  :slots (_rep_info ))

(defmethod pick_objects::RemoveBoxResponse
  (:init
   (&key
    ((:rep_info __rep_info) "")
    )
   (send-super :init)
   (setq _rep_info (string __rep_info))
   self)
  (:rep_info
   (&optional __rep_info)
   (if __rep_info (setq _rep_info __rep_info)) _rep_info)
  (:serialization-length
   ()
   (+
    ;; string _rep_info
    4 (length _rep_info)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _rep_info
       (write-long (length _rep_info) s) (princ _rep_info s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _rep_info
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _rep_info (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass pick_objects::RemoveBox
  :super ros::object
  :slots ())

(setf (get pick_objects::RemoveBox :md5sum-) "4f4d1ddc81d0c0808876510a339bea29")
(setf (get pick_objects::RemoveBox :datatype-) "pick_objects/RemoveBox")
(setf (get pick_objects::RemoveBox :request) pick_objects::RemoveBoxRequest)
(setf (get pick_objects::RemoveBox :response) pick_objects::RemoveBoxResponse)

(defmethod pick_objects::RemoveBoxRequest
  (:response () (instance pick_objects::RemoveBoxResponse :init)))

(setf (get pick_objects::RemoveBoxRequest :md5sum-) "4f4d1ddc81d0c0808876510a339bea29")
(setf (get pick_objects::RemoveBoxRequest :datatype-) "pick_objects/RemoveBoxRequest")
(setf (get pick_objects::RemoveBoxRequest :definition-)
      "
float64 linear_x
float64 linear_y
string info
---

string rep_info

")

(setf (get pick_objects::RemoveBoxResponse :md5sum-) "4f4d1ddc81d0c0808876510a339bea29")
(setf (get pick_objects::RemoveBoxResponse :datatype-) "pick_objects/RemoveBoxResponse")
(setf (get pick_objects::RemoveBoxResponse :definition-)
      "
float64 linear_x
float64 linear_y
string info
---

string rep_info

")



(provide :pick_objects/RemoveBox "4f4d1ddc81d0c0808876510a339bea29")


