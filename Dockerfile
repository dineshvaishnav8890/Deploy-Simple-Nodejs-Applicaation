# Use the latest official Ubuntu image as a base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Copy all files from the host to the container
COPY . .

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y npm git curl && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install npm dependencies
RUN npm install

# Expose port 3000 to the host
EXPOSE 3000

# Run the application
CMD ["node", "app.js"]
