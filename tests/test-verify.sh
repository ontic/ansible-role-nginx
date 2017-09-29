#!/bin/bash

# Verify the installed Nginx version.
docker exec --tty ${container_id} env TERM=xterm nginx -v