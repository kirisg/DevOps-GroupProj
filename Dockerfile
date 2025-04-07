# Use the official Jenkins LTS image as the base image
FROM jenkins/jenkins:lts

# Install any dependencies or packages you need
USER root
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && apt-get clean

# Switch back to Jenkins user
USER jenkins

# Expose ports
EXPOSE 8080
EXPOSE 50000

# Set up the Jenkins home directory
ENV JENKINS_HOME /var/jenkins_home
