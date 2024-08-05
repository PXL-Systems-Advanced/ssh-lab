# Use a base image with OpenSSH server installed
FROM ubuntu:latest

# Install OpenSSH server
RUN apt-get update && apt-get install -y openssh-server

# Create a new user
RUN useradd -rm -d /home/student -s /bin/bash -g root -G sudo -u 1001 student

# Set password for the user
RUN echo 'student:pxl' | chpasswd

# Create necessary directories
RUN mkdir /var/run/sshd

# Expose SSH port
EXPOSE 22

# Main process: SSH service
CMD ["/usr/sbin/sshd", "-D"]
