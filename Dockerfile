
# syntax=docker/dockerfile:1
#FROM circleci/node:10.16.3
#ENV NODE_ENV=production
#COPY ["package.json", "package-lock.json*", "./"]
#RUN sudo npm install
#COPY ..
#CMD ["npm", "start"]
# Set the working directory
#WORKDIR /usr/src/app


# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the application source
COPY . .

# Expose port and start the application
EXPOSE 8443
CMD ["node", "server.js"]
