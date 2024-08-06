# Use a base image with OpenSSH server installed
FROM ubuntu:latest

# Set non-interactive frontend for debconf
ENV DEBIAN_FRONTEND=noninteractive

# Install OpenSSH server and other necessary tools
RUN apt-get update && apt-get install -y \
  openssh-server \
  ubuntu-minimal

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
