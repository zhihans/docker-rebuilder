#!/bin/bash

cd AutoUpdateJdCookie-lite/
docker buildx build --platform linux/amd64,linux/arm64 -t "asnil/aujc:lite" . --push
