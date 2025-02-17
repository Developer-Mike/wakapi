# Build stage
FROM golang:1.21-alpine AS builder

WORKDIR /app

# Download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy source code and build
COPY . .
RUN go build -o wakapi

# Final stage
FROM alpine:latest

WORKDIR /app

# Copy binary from build stage
COPY --from=builder /app/wakapi /app/wakapi

# Copy configuration file
COPY config.yml /app/config.yml

# Expose default port (adjust according to your config.yml)
EXPOSE 3000

# Run the application
ENTRYPOINT ["./wakapi", "-config", "config.yml"]