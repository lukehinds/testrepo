# Start with a base image that has Go installed
FROM golang:1.20 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files
COPY go.mod go.sum ./

# Download the Go dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the Go application
RUN go build -o testsign

# Create a new lightweight image to run the application
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the built binary from the previous stage
COPY --from=builder /app/testsign .

# Set the entry point for the Docker container
ENTRYPOINT ["./testsign"]

