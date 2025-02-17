#!/bin/bash

docker run -d \
  -p 3000:3000 \
  -v wakapi-data:/data \
  --name wakapi \
  --restart unless-stopped \
  wakapi