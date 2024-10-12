#!/bin/bash

# Start VNC server on display :1
vncserver :1

# Start noVNC to expose the VNC server through the browser
/opt/noVNC/utils/novnc_proxy --vnc 127.0.0.1:5901 --listen 6080
