FROM ubuntu:20.04


# Pre-configure environment variables for locale and timezone to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Etc/UTC

# Install necessary packages: sudo, git, xfce, TigerVNC, noVNC dependencies, etc.
RUN apt-get update \
    && apt-get install -y sudo git xfce4 xfce4-terminal tigervnc-standalone-server wget net-tools python3 \
    && apt-get clean \
    && useradd -m -s /bin/bash ubuntu && echo "ubuntu:ubuntu" | chpasswd \
    && echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Install noVNC
RUN git clone https://github.com/iqbalcodes6602/noVNC /opt/noVNC \
    && git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify \
    && ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html

# Switch to user "ubuntu" for the rest of the build process
USER ubuntu
WORKDIR /home/ubuntu

# Set up TigerVNC and XFCE (with 6+ character password for VNC)
RUN mkdir -p /home/ubuntu/.vnc \
    && echo -e "#!/bin/bash\nstartxfce4 &" > /home/ubuntu/.vnc/xstartup \
    && echo "strongpassword" | vncpasswd -f > /home/ubuntu/.vnc/passwd \
    && chmod 600 /home/ubuntu/.vnc/passwd

# Copy the entrypoint script
COPY entry.sh /entry.sh

# Expose the VNC and noVNC ports
EXPOSE 5900 6080

CMD [ "/bin/bash", "/entry.sh" ]
