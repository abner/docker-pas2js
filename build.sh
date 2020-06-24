#!/bin/bash
docker build . -t abner/pas2js:latest --no-cache && \
docker rmi $(docker images -f "dangling=true" -q)
