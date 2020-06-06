# Build a Docker Container with Your Machine Learning Model

Ensure a safe consistent environment for your code. 

Dockerfile: what we need in your application.  You can build a Docker image from either `Dockerfile` or `docker-compose.yml`

A Docker image starts with a **base image** and is **built up by read-only layers**, with each of them adding some dependencies. In the end, you tell the container how to trigger your model.

Try with **minimalism template**:

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



## Installation
Go into the working directory `Machine-Learning-Docker`
```
cd Machine-Learning-Docker
```

Firstly, we need to **create** `Dockerfile` (specify what we need for building a Docker container). We can re-use the template file above. 

Create folder `src` and file `main.py`, set up the folder like this
Prepare the folder structure like this

```
- app-name
     |-- src
          |-- main.py
          |-- other_module.py
     |-- requirements.txt
     |-- Dockerfile
```

**Build the container** based on the `Dockerfile`

```
docker build -t machine-learning . 
```

**Test the project**

```
docker run -it --rm machine-learning python3 /src/test.py
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

## References

 https://towardsdatascience.com/build-a-docker-container-with-your-machine-learning-model-3cf906f5e07e

 https://docs.docker.com/engine/reference/builder/