(ql:quickload :swank)

(setf swank::*loopback-interface* "0.0.0.0")
(swank:create-server :port 2020 :dont-close t)
