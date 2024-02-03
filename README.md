A project on system administration utilizing Docker containers
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
   
