![Alt text](structure.png?raw=true "Title")

# What is Virtualization ?
Virtualization is the process by which hypervisors partition physical resources into virtual resources, allowing multiple virtual machines (VMs) to run in isolated environments on a single physical server. This technology maximizes resource utilization, improves scalability, and reduces operational costs.
# what is Containerization ?
Containerization is a lightweight form of virtualization that involves encapsulating an application and its dependencies into a container. This container can run consistently across various computing environments. Unlike virtual machines, containers share the host operating system's kernel but maintain isolated user spaces, making them more efficient in terms of resource usage. Common containerization platforms include Docker and Kubernetes.
# What is the difference between containerization and virtualization ?
### Difference between Containerization and Virtualization

**Virtualization:**

- Virtualization involves creating multiple virtual machines (VMs) on a single physical server using a hypervisor.
- Each VM runs its own operating system (guest OS) and is isolated from other VMs.
- VMs are resource-intensive because they require separate instances of the operating system and allocate a fixed amount of resources.
- Common hypervisors include VMware, Hyper-V, and KVM.

**Containerization:**

- Containerization involves encapsulating an application and its dependencies into a container, which shares the host operating system's kernel.
- Containers run in isolated user spaces but do not require separate operating systems.
- Containers are lightweight and more efficient in terms of resource usage compared to VMs.
- Common containerization platforms include Docker and Kubernetes.

In summary, while both technologies enable isolated environments for applications, virtualization uses separate operating systems for each VM, leading to higher resource consumption, whereas containerization shares the host OS kernel, making it more efficient and lightweight.

## Project description 
 1. **Docker Image Setup:**
   - Created Docker images for NGINX, WordPress with php-fpm, and MariaDB.

2. **Dockerfile Creation:**
   - Wrote Dockerfiles for each service, specifying either Alpine or Debian.
   - Ensured Dockerfiles were called in the docker-compose.yml.

3. **Build Docker Images:**
   - Implemented a Makefile to build Docker images for the project.
   - Prohibited the use of pre-built Docker images and DockerHub services.

4. **Service Containers:**
   - Set up NGINX container with TLSv1.2 or TLSv1.3 only.
   - Created a WordPress container with php-fpm.
   - Set up a MariaDB container.

5. **Volume Configuration:**
   - Created a volume for the WordPress database.
   - Created a second volume for WordPress website files.

6. **Networking:**
   - Established a Docker network for inter-container communication.

7. **Restart Configuration:**
   - Configured containers to automatically restart in case of a crash.

8. **Documentation:**
   - Documented the setup process and configurations.
   - Provided clear instructions for replication.
   
 ## to start project run the following commands
```bash
cd srcs
cp env_example .env
docker compose up --build
