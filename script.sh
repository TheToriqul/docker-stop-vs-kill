#!/bin/bash

###############################################################################
#
# Docker Container Management Commands Reference
# Author: Md Toriqul Islam
# Description: Command reference for Docker container lifecycle management
# Note: This is a reference script. Do not execute directly.
#
###############################################################################

#------------------------------------------------------------------------------
# Container Lifecycle Management
#------------------------------------------------------------------------------

# Start a container with SIGTERM handling
docker run --name graceful-termination -d ubuntu:latest /bin/bash -c \
    "trap 'echo SIGTERM received; exit 0' SIGTERM; while :; do echo 'Running'; sleep 1; done"

# Start a container for force termination testing
docker run --name force-termination -d ubuntu:latest /bin/bash -c \
    "trap 'echo SIGTERM received; exit 0' SIGTERM; while :; do echo 'Running'; sleep 1; done"

#------------------------------------------------------------------------------
# Container Termination Commands
#------------------------------------------------------------------------------

# Graceful stop with default timeout (10 seconds)
docker stop graceful-termination

# Force kill container
docker kill force-termination

# Stop with custom timeout
docker stop -t 20 graceful-termination

#------------------------------------------------------------------------------
# Monitoring & Logging
#------------------------------------------------------------------------------

# View container logs
docker logs graceful-termination
docker logs force-termination

# Follow container logs in real-time
docker logs -f graceful-termination

# Show container status
docker ps
docker ps -a  # Show all containers including stopped ones

#------------------------------------------------------------------------------
# Container Cleanup
#------------------------------------------------------------------------------

# Remove specific containers
docker rm graceful-termination
docker rm force-termination

# Remove all stopped containers
docker container prune

# Remove containers and their volumes
docker rm -v graceful-termination

#------------------------------------------------------------------------------
# Container Inspection
#------------------------------------------------------------------------------

# Show detailed container information
docker inspect graceful-termination

# Monitor container resource usage
docker stats graceful-termination

# View container processes
docker top graceful-termination

###############################################################################
# End of Command Reference
###############################################################################