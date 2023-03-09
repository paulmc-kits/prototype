# version of node to use
FROM node:18-slim
# define working directory for docker
WORKDIR /src
# copy all our source code into the working directory
COPY package*.json ./
# install npm dependencies 
RUN npm install 
#neesd to check audit
RUN npm audit || true
COPY app/ .
# expose port 3000 for our server to run on
EXPOSE 3000
# command to start our server
CMD ["npm", "run", "dev"]
