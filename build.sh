#!/bin/bash
docker build --build-arg USER_ID=1001 --no-cache -t opencode-ai:latest .
