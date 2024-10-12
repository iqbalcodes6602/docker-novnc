#!/bin/bash

# Start Xvfb on display :99 with the specified resolution and color depth
Xvfb :99 &

# Export the DISPLAY environment variable
export DISPLAY=:99

# Start the VNC server on display :99
vncserver :99 &

# Start Openbox as the window manager
openbox &

# Start noVNC to proxy the VNC connection to the web
/opt/noVNC/utils/novnc_proxy --vnc 127.0.0.1:5999 --listen 6080 &

# Function to start Firefox and restart it if it exits
while true; do
    echo "Starting Firefox..."
    firefox &
    FIREFOX_PID=$!
    wait $FIREFOX_PID
    echo "Firefox exited. Restarting in 3 seconds..."
    sleep 3
done