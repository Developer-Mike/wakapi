#!/bin/bash

docker run -d \
  -p 443:3000 \
  -v ~/wakapi/config.yml:/app/config.yml:ro \
  -v ~/wakapi/origin-certificate.pem:/certs/origin-certificate.pem:ro \
  -v ~/wakapi/private-key.pem:/certs/private-key.pem:ro \
  -v wakapi-data:/data \
  --name wakapi \
  --restart unless-stopped \
  wakapi