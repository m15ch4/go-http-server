# Use a lightweight base image; for example, Alpine Linux or Scratch
FROM scratch

# Set the working directory in the container
WORKDIR /app

# Copy the binary into the container
COPY ./bin/go-http-server /app/

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./go-http-server"]