
<center><img src="cohort_007.jpg"  alt="Clarusway" width="600"/></center>
<br>

<center><h1> Django Class Notes</h1></center>
<p>Clarusway<img align="right"
  src="https://secure.meetupstatic.com/photos/event/3/1/b/9/600_488352729.jpeg"  width="15px"></p>
<br>


# Docker for Developers

### Needs
- Node.js
- Npm
- Docker Desktop
- Docker Hub account

<br>

## Server Systems

- **Physical Servers (BareMetal Servers):**
  - Computers with high hardware specifications, specialized processors, and operating systems.
  - Installation: Complex
  - Data Transfer: Difficult
  - Cost: High
  - Dedicated Servers
- **Virtual Servers (VMs: Virtual Machines):**
  - Multiple virtual machines within a physical machine.
  - Installation: Moderate (iso image)
  - Data Transfer: Moderate
  - Cost: Moderate
  - Transition from one machine to another is challenging.
  - Hypervisor software -> [vmware.com](https://www.vmware.com/)
  - VPS (Virtual Private Server), VDS (Virtual Dedicated Server)
- **Containers:**
  - Multiple containers within a physical/virtual machine.
  - Installation: Easy (docker image)
  - Data Transfer: Easy
  - Cost: Low
  - Manage all containers from the same environment.
  - Microservice architecture.
  - Container software -> [docker.com](https://www.docker.com/)

---

### **Docker vs. Virtual Machines (VMs): A Comparison**

Understanding the differences between Docker (containers) and Virtual Machines (VMs) is crucial for developers when deciding on the right tool for their needs. Below is a detailed comparison:

| **Feature**                 | **Virtual Machines (VMs)**                                   | **Docker (Containers)**                                      |
| --------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Architecture**            | Runs on a **hypervisor** with a full **guest OS** for each VM. | Shares the **host OS kernel**, making it lightweight.        |
| **Isolation**               | Stronger isolation due to separate OS instances.             | Process-level isolation using the same host OS kernel.       |
| **Resource Usage**          | Heavyweight: Requires substantial CPU, memory, and storage.  | Lightweight: Consumes fewer resources as it uses host OS kernel. |
| **Startup Time**            | Slow: Can take minutes to boot up.                           | Fast: Containers start in seconds.                           |
| **Performance**             | Slightly slower due to overhead of the full OS and hypervisor. | Near-native performance due to minimal abstraction.          |
| **Portability**             | Limited: VMs are tied to the hypervisor and require reconfiguration. | Highly portable: Can run on any machine with Docker installed. |
| **Storage**                 | Each VM has its own disk image, which can be large.          | Uses layered file systems for images, making them smaller and reusable. |
| **Use Case**                | Best for running multiple OS instances or applications with complex dependencies. | Ideal for microservices, CI/CD pipelines, and lightweight applications. |
| **Management**              | Managed via virtualization platforms (e.g., VMware, VirtualBox). | Managed via Docker CLI and tools like Docker Compose.        |
| **Updates and Maintenance** | Complex, as each VM requires separate OS updates and patches. | Easier, as containers rely on the host OS for kernel updates. |
| **Networking**              | Requires virtual network interfaces for communication.       | Containers communicate through lightweight Docker networks.  |

------

### **Key Differences**

1. **System Overhead**:
   - VMs include a full OS for each instance, leading to greater resource consumption.
   - Docker containers share the host OS kernel, making them much lighter.
2. **Startup Time**:
   - VMs take longer to boot since the OS needs to initialize.
   - Docker containers start almost instantly because they are just processes on the host.
3. **Portability**:
   - Docker containers are portable across any system with Docker, whereas VMs may require specific configurations and hypervisor support.

------

### **When to Use What?**

| **Scenario**                      | **Use Virtual Machines**                         | **Use Docker Containers**                        |
| --------------------------------- | ------------------------------------------------ | ------------------------------------------------ |
| **Need for multiple OS types**    | Running apps that require different OS versions. | Not suitable for this scenario.                  |
| **Resource constraints**          | Not ideal due to higher overhead.                | Perfect due to low resource usage.               |
| **Rapid application development** | Slower and less efficient for iterative changes. | Ideal for CI/CD and agile development workflows. |
| **Isolation and security**        | Stronger isolation for running untrusted code.   | Suitable for trusted apps with shared OS.        |
| **Microservices architecture**    | Overkill for small, lightweight services.        | Designed for lightweight, independent services.  |

------

### **Visual Comparison**

Here’s a breakdown of the architecture:

1. **Virtual Machine Architecture**:
   - Hardware → Host OS → Hypervisor → Guest OS (VM1, VM2, etc.) → Application.
2. **Docker Architecture**:
   - Hardware → Host OS → Docker Engine → Containers (App1, App2, etc.).

------

### **Why Developers Prefer Docker**

- **Speed**: Instant container startup accelerates development and testing.
- **Consistency**: Works the same on all machines with Docker installed.
- **Cost**: Lower resource usage reduces hardware and cloud expenses.
- **Scalability**: Containers are easy to replicate and scale across systems.

---

## Fundamental Information

- IP and Port:
  - Default ports: 80, 443 -> [List of TCP and UDP Port Numbers](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)
  - http -> 80 * [http://clarusway.com](http://clarusway.com/) == [http://clarusway.com:80](http://clarusway.com/)
  - https -> 443 * [https://clarusway.com](https://clarusway.com/) == [https://clarusway.com:443](https://clarusway.com/) (requires SSL)

## **Introduction to Docker**

Docker is a platform that enables developers to build, share, and run applications in isolated environments called **containers**. Containers package an application and its dependencies, ensuring consistency across various environments.

- Why Docker?
  - Solve the "it works on my machine" problem.
  - Lightweight and faster than virtual machines.
  - Consistent environment for development, testing, and production.
  - Easy to share and deploy applications.

Developers often face the challenge of ensuring that their project works seamlessly on different machines. Docker addresses this challenge by providing a platform for automating the deployment of applications in lightweight, portable containers.

- Docker creates containers.
- Containers are similar to virtual machines or instances, but they can share system resources, unlike VMs.
- One process per Docker container.
- **Containerization Technology:**
  - Docker is a platform that enables developers to automate the deployment of applications in lightweight, portable containers.
- **Isolation:**
  - Containers provide a way to package applications and their dependencies, ensuring consistency across different environments.
- **Build:**
  - Docker builds images from a `Dockerfile` and a `context`.
  - The build's context includes the set of files in the specified PATH or URL.
  - Docker Hub is a repository for sharing and distributing Docker images.
- **Share:**
  - Docker Hub provides a cloud-based registry for sharing and distributing container images.
  - Docker images can be pushed to Docker Hub for sharing and deployment.
- **Run:**
  - Docker facilitates efficient development by leveraging Docker images to create applications on any operating system.
  - Multi-container applications can be created using Docker Compose.

------

## **Key Docker Concepts**

1. **Images:**
   - A lightweight, standalone, and executable package that includes everything needed to run an application (code, runtime, libraries, dependencies, etc.).
   - Images are built using **Dockerfiles**.
2. **Containers:**
   - A runtime instance of a Docker image.
   - Containers are isolated but share the host operating system's kernel.
3. **Dockerfile:**
   - A text file containing a series of commands to create a Docker image.
4. **Docker Hub:**
   - A cloud-based repository to find and share container images.
5. **Volumes:**
   - Used for persisting data outside a container's lifecycle.

---

### Installing Docker Desktop

[Docker Desktop](https://docs.docker.com/desktop/) is an application that simplifies the development of containerized applications and microservices. It is compatible with Mac, Linux, and Windows environments.

- Docker Desktop provides a graphical user interface and command-line tools.
- It enables building and sharing containerized applications.

Now, start Docker Desktop to work on Docker. See the features.

- Verify installation:

  ```bash
  docker --version
  ```

------

## **Docker Workflow**

1. Write Code:

   - Write your application code (e.g., Node.js, Python, Java, etc.).

2. Create a Dockerfile:

   - Define the environment and dependencies for your application.

3. Build the Image:

   ```bash
   docker build -t <image_name> .
   ```

4. Run the Container:

   ```bash
   docker run -p <host_port>:<container_port> <image_name>
   ```

5. Test and Debug:

   - Use logs and interactive shell inside the container for debugging.

------

## **Writing a Dockerfile**

A **Dockerfile** is a script to define an image. Below is an example for a simple Node.js application:

```dockerfile
# Base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
```

---

### Basic Docker Commands

We do not have to memorize Docker commands. Here is a simple [cheat sheet](https://docs.docker.com/get-started/docker_cheatsheet.pdf).

- **Basic Commands:**

```bash
$ docker --version
$ docker version

$ docker info

$ docker --help
$ docker help
$ docker build --help

$ docker search <imagename> # search on dockerhub
```

- **Image Management:**
  - `docker images`: List available images.
  - `docker build -t <image_name>`: Build an image from Dockerfile.
  - `docker rmi <image_id>`: Remove an image.
  - `docker pull`: Download an image from Docker Hub.
- **Container Lifecycle:** 
  - `docker run <image_name>`: Create and start a container.
  - `docker stop <container_id>`: Stop a running container.
  - `docker start <container_id>`: Start a stopped container.
  - `docker rm <container_id>`: Remove a container.
  - `docker ps`: List running containers.
  - `docker ps -a`: List all containers.
- **Debugging and Logs:**
  - `docker logs <container_id>`: View logs
  - `docker exec -it <container_id> bash`: Access container shell


For detailed command options, visit the [Docker CLI guide](https://docs.docker.com/engine/reference/commandline/cli/). 

## Docker Hub

[Docker Hub](https://www.docker.com/products/docker-hub/#:~:text=Docker%20Hub%20is%20a%20hosted,push%20them%20to%20Docker%20Hub) is the world’s largest repository of container images with an array of content sources including container community developers, open source projects and independent software vendors (ISV) building and distributing their code in containers. Users get access to free public repositories for storing and sharing images or can choose subscription plan for private repos.

- A cloud-based registry for sharing and distributing container images.
- Store and retrieve Docker images to streamline collaboration.

Docker Hub is a hosted repository service provided by Docker for finding and sharing container images with your team.

Key features include:
- Private Repositories: Push and pull container images.
- Automated Builds: Automatically build container images from GitHub and Bitbucket and push them to Docker Hub.
- Teams & Organizations: Manage access to private repositories.
- Official Images: Pull and use container images provided by Docker.
- Publisher Images: Pull and use container images provided by external vendors. Certified images also include support and guarantee compatibility with Docker Enterprise.
- Webhooks: Trigger actions after a successful push to a repository to integrate Docker Hub with other services.

## Dockerize a Simple Node.js App

- Docker operations are generally three stages. 
  - Build image from a Dockerfile,
  - Push image to registry for future uses,
  - Run image to create container.
- Let's dockerize our Nodejs project.

#### Project Folder SetUp

- Create a working directory named `project`. 
- Create a `hello.js` file inside project folder and add below code in it.

```js
console.log("Hello Docker!")
```

#### Dockerfile

- Create a new file and name it as `Dockerfile`

```dockerfile
# INSTRUCTION arguments

# The FROM instruction initializes a new build stage and sets 
# the Base Image for subsequent instructions. As such, a valid 
# Dockerfile must start with a FROM instruction.

# Select a base image which suits your usecase
# Consider using smallest image possible. But there
# are other considerations like security and packages.
FROM node:20.9.0-alpine

# The WORKDIR instruction sets the working directory for any RUN, CMD, 
# ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile. 
# If the WORKDIR doesn’t exist, it will be created even if it’s not used 
# in any subsequent Dockerfile instruction.
WORKDIR /app


# The COPY instruction copies new files or directories from <src> and adds 
# them to the filesystem of the container at the path <dest>.

# Docker checks if layers can be reused, if it finds that there are 
# no changes to the requirements.txt file, it will jump straight 
# to the COPY instruction, which will be resolved in a matter of seconds. 
# With this tiny change, we speed up a lot the build process: No more 
# waiting for minutes between builds each time that we modify something 
# in our code.

# Copy all the working directory to the container. Optionally a
# `.dockerignore` file can be used not to copy unrelated things
# to the continer and keep it smaller in size and less vulnerable.
COPY hello.js /app
# COPY . /app
# COPY . .

# The main purpose of a CMD is to provide defaults for an executing 
# container. There can only be one CMD instruction in a Dockerfile. 
# If you list more than one CMD then only the last CMD will take effect.

CMD node hello.js
```

- Open Docker Desktop tool before executing any docker operation. This tool is using Docker deamon and having a nice user interface enables us to do our task easily.

#### Build

```dockerfile
# Build the Docker image in the current directory.
# `docker build .`: This command builds a Docker image from the current directory. The `.` represents the build context, which includes the files needed for the image.
$ docker build .

# Build the Docker image and give it a name.
# `docker build . --tag <imagename>` or `docker build . -t <imagename>`: Tags the built image with the specified name `<imagename>`.
$ docker build . --tag <imagename>
$ docker build . -t <imagename>

# Build the Docker image with a specific version or tag.
# `docker build . -t <imagename>:v2` or `docker build . -t <imagename>:v2 --no-cache`: Tags the image with a version (`v2`) and optionally disables caching during the build.
$ docker build . -t <imagename>:v2
$ docker build . -t <imagename>:v2 --no-cache

# List Docker images.
# `docker image ls` or `docker images`: Lists Docker images on the local machine.
$ docker image ls
$ docker images

# we can see the details of this image ( Like id sha, tags, environment variables, OS configuration, volumes etc. ) with the command;

$ docker inspect <image id>

# Remove a Docker image.
# `docker rmi <imagename>` or `docker rmi <imagename> -f`: Removes a Docker image. The `-f` flag forces removal.

$ docker rmi <imagename>
$ docker rmi <imagename> -f

# Remove unused Docker images.
# `docker image prune -f -a`: Removes unused Docker images. The `-f` flag forces removal without confirmation.
$ docker image prune -f -a

# Add or change the tag of a Docker image.
# `docker tag <imagename> <newimagename>`: Adds or changes the tag of a Docker image.
$ docker tag <imagename> <newimagename>

# Run a Docker container from an image.
# `docker run <imagename>`: Runs a Docker container from the specified image.
$ docker run <imagename>

# Run a Docker container from an image with a specified name.
# `docker run --name <containername> <imagename>`: Runs a Docker container with a specified name.
$ docker run --name <containername> <imagename>

# List running Docker containers.
# `docker container ls` or `docker ps`: Lists running Docker containers.
$ docker container ls
$ docker ps

# List all Docker containers, including stopped ones.
# `docker container ls -a` or `docker ps -a`: Lists all Docker containers, including stopped ones.
$ docker container ls -a
$ docker ps -a

# Start or stop a Docker container.
# `docker start|stop <containername>`: Starts or stops a running Docker container.
docker start|stop <containername>

# Remove a Docker container.
# `docker rm <containername>` or `docker rm <containername> -f`: Removes a Docker container.
$ docker rm <containername>
$ docker rm <containername> -f

# Remove unused Docker containers.
# `docker container prune -f`: Removes unused Docker containers.
$ docker container prune -f

# Open an interactive shell in a Docker container.
# `docker run -it <imagename> sh`: Opens an interactive shell in a Docker container.
$ docker run -it <imagename> sh

# Exit from interactive mode.
# `exit`: Exits from interactive mode within a container.
$ exit

# For interactive processes (like a shell), you must use -i -t together.
$ docker exec [OPTIONS] CONTAINER COMMAND [ARG...]
$ docker exec -it <container_id> sh
$ docker exec -it 37b5afe65eaa sh
```
