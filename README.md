# Systems Advanced: Linux Containers
# SSH Lab

This repository contains the configuration files to set up a lab environment for practicing SSH using Docker containers.

The lab consists of two containers running an SSH server, allowing for SSH communication between them.

## Setup Instructions

### Pre-requisites

- [Docker & Docker Compose](https://www.docker.com/get-started)
- [Git](https://github.com/git-guides/install-git)

### Clone the Repository

Clone this repository to your local machine:

```sh
git clone PXL-Systems-Advanced/ssh-lab
cd ssh-lab
```

### Build and Run the Containers

Use Docker Compose to build the images and start the containers:

```sh
docker-compose up -d
```

This will build the Docker image from the Dockerfile and start two containers, `ssh-server1` and `ssh-server2`.

## Usage

### Get Container IP Addresses

To SSH between the containers, you need their IP addresses. Run the following commands to get the IP addresses:

```sh
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ssh-server1
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ssh-server2
```

### SSH Between Containers

1. Exec into `ssh-server1`:

    ```sh
    docker exec -it ssh-server1 bash
    ```

2. Inside `ssh-server1`, SSH into `ssh-server2`:

    ```sh
    ssh student@<IP_ADDRESS_OF_SSH_SERVER2>
    ```

    Replace `<IP_ADDRESS_OF_SSH_SERVER2>` with the actual IP address obtained from the previous step.

    Use the password `pxl` when prompted.

## Cleanup

To stop and remove the containers, run:

```sh
docker-compose down
```

