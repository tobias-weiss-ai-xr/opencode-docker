#!/bin/bash
docker build --build-arg USER_ID=$(id -u) -t opencode-ai:latest .
