# Use official ubuntu base image
FROM ubuntu:24.04

# Set non-interactive frontend for debconf
ENV DEBIAN_FRONTEND=noninteractive

# Install OpenSSH server and other necessary tools
# And clean up the apt cache to reduce the image layer size
RUN apt-get update && apt-get install -y \
  openssh-server \
  ubuntu-minimal \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create new user 'student' with sudo privileges
RUN useradd -rm -d /home/student -s /bin/bash -g root -G sudo -u 1001 student

# Set password for the 'student' and 'root' user
RUN echo 'student:pxl' | chpasswd
RUN echo 'root:pxl' | chpasswd

# Create necessary directories for sshd
RUN mkdir /var/run/sshd

# Expose SSH port
EXPOSE 22

# Main process: SSH service
CMD ["/usr/sbin/sshd", "-D"]
