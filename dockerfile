# Step 1: Use the official Golang image as the base image
FROM golang:1.20-alpine

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the Go Modules files and download dependencies
COPY go.mod go.sum ./
RUN go mod tidy

# Step 4: Copy the entire source code into the container
COPY . .

# Step 5: Build the Go application
RUN go build -o myapp .

# Step 6: Expose the port your Go application runs on (e.g., 8080)
EXPOSE 8080

# Step 7: Define the command to run your app
CMD ["./myapp"]
