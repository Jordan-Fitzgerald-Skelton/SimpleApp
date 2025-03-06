#!/usr/bin/env bash

# Update and install Node.js and npm
sudo apt update && sudo apt install nodejs npm -y

# Install pm2 which is a production process manager for Node.js
sudo npm install -g pm2

# Stop any instance of the application currently running under pm2
pm2 stop example_app

# Change directory into the folder where the application is downloaded
cd ExampleApplication/

# Install application dependencies
npm install

echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt

# Start the application with the process name "example_app" using pm2
pm2 start ./bin/www --name example_app
