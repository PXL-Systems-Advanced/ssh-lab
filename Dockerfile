# Use official Ubuntu base image
FROM ubuntu:24.04

# Set non-interactive frontend for debconf
ENV DEBIAN_FRONTEND=noninteractive

# Install OpenSSH server and other necessary tools
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

# Ensure no SSH host keys are present in the image (to force regeneration)
RUN rm -f /etc/ssh/ssh_host_*_key /etc/ssh/ssh_host_*_key.pub

# Expose SSH port
EXPOSE 22

# Command to regenerate SSH keys on container startup if they don't exist, and start the SSH service
CMD ["/bin/sh", "-c", "test -f /etc/ssh/ssh_host_ed25519_key || ssh-keygen -A && exec /usr/sbin/sshd -D"]
