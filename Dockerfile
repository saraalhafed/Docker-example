# select an image to use as a parent image
FROM node:20.9.0-alpine

# set the working directory(in docker app)
WORKDIR /app

# copy the files from your host (local computer)to the container(in docker app)
# COPY hello.js /app
# . means everthing in the current directory(everything in hello.js  to /app in docker container )
# COPY . /app
# second . means to the working directory 
COPY . .

# run the app
# you can have only one CMD in the Dockerfile
# CMD ["node", "hello.js"]
# all the commands except CMD are used for building the image
# CMD is used for running the image in the container
CMD node hello.js

#each server or application has own docker file