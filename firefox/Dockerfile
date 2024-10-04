FROM alpine:latest

LABEL maintainer="Don <novaspirit@novaspirit.com>"

# Install necessary packages including Firefox and Openbox
RUN apk add --no-cache sudo git bash python3 tigervnc xorg-server xf86-video-dummy \
    firefox openbox dbus \
    && adduser -h /home/alpine -s /bin/bash -S -D alpine \
    && echo alpine:alpine | chpasswd \
    && echo 'alpine ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && git clone https://github.com/novnc/noVNC /opt/noVNC \
    && git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify

# Switch to root to copy entry.sh and set permissions
USER root
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

# Switch back to non-root user 'alpine'
USER alpine
WORKDIR /home/alpine

# Set up VNC and noVNC
RUN mkdir -p /home/alpine/.vnc \
    && echo -e "#!/bin/bash\nopenbox &\nfirefox &" > /home/alpine/.vnc/xstartup \
    && chmod +x /home/alpine/.vnc/xstartup \
    && echo "alpine" | vncpasswd -f > /home/alpine/.vnc/passwd \
    && chmod 600 /home/alpine/.vnc/passwd

# Expose the noVNC port
EXPOSE 6080

# Start the container using the entry script
CMD [ "/bin/bash", "/entry.sh" ]
