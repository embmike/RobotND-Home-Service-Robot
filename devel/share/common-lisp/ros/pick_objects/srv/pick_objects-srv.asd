
(cl:in-package :asdf)

(defsystem "pick_objects-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PlaceBox" :depends-on ("_package_PlaceBox"))
    (:file "_package_PlaceBox" :depends-on ("_package"))
    (:file "RemoveBox" :depends-on ("_package_RemoveBox"))
    (:file "_package_RemoveBox" :depends-on ("_package"))
  ))