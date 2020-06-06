# Docker-All-We-Need
## Docker

We need to have the Dockerfile inside the folder.

### Build locally

```
docker build -t probot-hello .
```

## Test the project

```
docker run -it --rm probot-hello npm run test
```

--rm: remove the container on exit. 

## Develop locally 

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





# Build a Docker Container with Your Machine Learning Model

Ensure a safe consistent environment for your code. 

Dockerfile: what we need in your application.  You can build a Docker image from either `Dockerfile` or `docker-compose.yml`

A Docker image starts with a **base image** and is **built up by read-only layers**, with each of them adding some dependencies. In the end, you tell the container how to trigger your model.

Try with minimalism template above!

```
FROM python:3.6-stretch
MAINTAINER Tina Bu <tina.hongbu@gmail.com>

# install build utilities
RUN apt-get update && \
	apt-get install -y gcc make apt-transport-https ca-certificates build-essential

# check our python environment
RUN python3 --version
RUN pip3 --version

# set the working directory for containers
WORKDIR  /usr/src/<app-name>

# Installing python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all the files from the project’s root to the working directory
COPY src/ /src/
RUN ls -la /src/*

# Running Python Application
CMD ["python3", "/src/main.py"]
```

Start with Python 3.6 stretch image, `apt-get` update the system libraries. Install some `make` and `build` stuff. Check the python and pip version. 

Setup my work directory, copied `requirement.txt` to the container and pip installed all the libraries in it. 

Finally, copied all the other code files to the container. Trigger my entrypoint `main.py` file. 

Prepare the folder structure like this

```
- app-name
     |-- src
          |-- main.py
          |-- other_module.py
     |-- requirements.txt
     |-- Dockerfile
```

`pipreqs` : output the ones actually imported by this project. 

`eneric Ubuntu Image`: use the official base image like `Alpine Python`: difficult to work with, especially for installing packages.

`Python 3.6 stretch`: official Python image based on Debian 9. 

A smaller image generally means it’s **faster** to **build** and **deploy**.

Keep the image as lean as possible, use `.dockerignore` which works exactly like `.gitignore` to ignore files that won’t impact the model.

```
FROM <docker-image>
COPY <src> <dst> 
RUN chown -R 

USER node 
WORKDIR <current-working-directory>
RUN npm install : install the modules 
```



## Tips

In the `Dockerfile` , always add your `requirements.txt` file before copying the source code.

```
# Installing python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all the files from the project’s root to the working directory
COPY src/ /src/
RUN ls -la /src/*
```

 In that way, when you change your code and re-build the container, Docker will r**e-use the cached layer up** until the installed packages instead of executing the `pip install` command on every build even if the library dependencies never changed. No one wants to wait a couple of extra minutes just because you added an empty line in your code.



## Appendix I - Dockerfile Commands

A quick summary of a few basic commands .



docker pull: Pull the official image from docker-hub



docker to dockerize the all the applications 



## Reference

https://towardsdatascience.com/build-a-docker-container-with-your-machine-learning-model-3cf906f5e07e

https://docs.docker.com/engine/reference/builder/