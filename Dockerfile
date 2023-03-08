# version of node to use
FROM node:18
# define working directory for docker
WORKDIR /src
# copy all our source code into the working directory
COPY package*.json ./
# install npm dependencies 
RUN npm install 
COPY app/ .
# expose port 3000 for our server to run on
EXPOSE 2000
# command to start our server
CMD ["npm", "run", "dev"]
