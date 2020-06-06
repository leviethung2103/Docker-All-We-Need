# Docker-All-We-Need

## 1. System Requirements

- Ubuntu: 18.04

## 2. Install the docker

Take a look the reference [Docker Installation](https://docs.docker.com/engine/install/ubuntu/). I have built a script that automatically installs the docker engine. 
```
bash install_docker.sh
```

## 3. Docker with Travis CI 

Download a sample repo which uses docker with travis CI 
```
git clone https://github.com/leviethung2103/WEB1066-probot-hello
cd WEB1066-probot-hello
# Go to master_docker branch 
checkout master_docker
```

We need to have the Dockerfile inside the folder.

### 3.1 Build locally

```
docker build -t probot-hello .
```

### 3.2 Test the project

```
docker run -it --rm probot-hello npm run test
```

--rm: remove the container on exit. 

## 4. Develop locally 

 Changes to source code get reflected in the container and node restarts our app with the lastest changes

```
docker run -it --rm |
			-e APP_ID=abc \
			-e PRIVATE_KEY=none \
			-w /home/node/probot-hello-dev \
			-v "$(pwd)":/home/node/probot-hello-dev \
			-p 3000:3000 probot-hello \
			bash -c 'npm install && npm run dev'
```

`npm run dev`: watcher to changes, see the real time updates in the application.



**Dockerfile Sample**

```
# https://hub.docker.com/_/node/
FROM node:8-onbuild

# use debug to troubleshoot
ENV LOG_LEVEL=error
# Required env settings determined by GitHub App
ENV APP_ID=1234
ENV WEBHOOK_SECRET=development
ENV WEBHOOK_PROXY_URL=https://localhost:3000/
ENV PRIVATE_KEY="someprivatestring"

# see https://github.com/nodejs/docker-node/blob/e3ec2111af089e31321e76641697e154b3b6a6c3/docs/BestPractices.md#global-npm-dependencies
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

# Lets install our app into /home/node
COPY . /home/node/probot-hello
RUN chown -R node:node /home/node/probot-hello

# setup our app
# non-root user  https://github.com/nodejs/docker-node/blob/e3ec2111af089e31321e76641697e154b3b6a6c3/docs/BestPractices.md#non-root-user
USER node

WORKDIR /home/node/probot-hello
RUN npm install
```

## Reference

 [Docker Installation](https://docs.docker.com/engine/install/ubuntu/)

[Continous Integration](https://www.coursera.org/learn/continuous-integration/home/welcome)

