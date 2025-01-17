# Build stage: Use a lightweight Go image
FROM golang:1.22-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files and cache dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the Go application for the target architecture
RUN GOOS=linux GOARCH=arm64 go build -o takenote .

# Runtime stage: Use a smaller Alpine image for deployment
FROM alpine:latest

# Install necessary runtime dependencies (e.g., CA certificates)
RUN apk --no-cache add ca-certificates

# Set a working directory
WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/takenote .

# Copy the .env file into the image
COPY .env /root/.env

# Expose the port the application runs on (default: 8080)
EXPOSE 8080

# Command to run the application
CMD ["./takenote"]
