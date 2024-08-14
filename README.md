json-health-server
==

## Container Usage

### Pull the image from the repo

```sh
docker pull ghcr.io/mitchallen/json-health-server:latest
```

### Run the image locally as a container

This will pull the image down from the repo if you didn't already.

This example runs the server locally on port 3200.

If you are using something like an M1 Mac you can add the platform tag:

```sh
docker run --platform linux/amd64 -p 3200:3000 --name health-server ghcr.io/mitchallen/json-health-server:latest
```

Or you can run it without the platform tag:

```sh
docker run -p 3200:3000 --name health-server ghcr.io/mitchallen/json-health-server:latest
```

* * *

### Running Multiple Containers

You can run multiple containers on multiple ports like this:

* On a Mac:

```sh
docker run --platform linux/amd64 -p 3201:3000 --name health1 ghcr.io/mitchallen/json-health-server:latest

docker run --platform linux/amd64 -p 3202:3000 --name health2 ghcr.io/mitchallen/json-health-server:latest
``` 

* Or without the platform tag:

```sh
docker run -p 3201:3000 --name health1 ghcr.io/mitchallen/json-health-server:latest

docker run -p 3202:3000 --name health2 ghcr.io/mitchallen/json-health-server:latest
``` 

* * *

### Start and stop a running container

```sh
docker stop health-server
docker stop health1
docker stop health2

docker start health-server
docker start health1
docker start health2
```
    
* * *

### Remove

#### Remove Container

```sh
docker stop health-server

docker rm health-server
```

#### Remove the extra containers (if any)

```sh
docker stop health1 health2

docker rm health1 health2
```

### Remove Image

```sh
docker stop health-server
docker rm health-server
docker rmi ghcr.io/mitchallen/health-server:latest
```

* * *

## Developer Usage

Run `make` with no arguments for a list of commands:

```sh
make
```

For example:

```sh
Available targets:
  make start            - Run the Node.js application
  make docker-clean     - Stop, remove the Docker container, and remove the Docker image
  make docker-build     - Build the Docker image
  make docker-run       - Build the Docker image and run the container
  make docker-rerun     - Clean, build, and run the Docker container
  make docker-stop      - Stop the Docker container
  make docker-start     - Start the Docker container
  make test             - Run tests (currently not specified)
```

### Run

To get started, run this command:

```sh
make docker-run
```

* Browse to the root endpoint - showing server status:

* http://localhost:3100/

* Browse to the API Swagger Explorer: 

* http://localhost:3100/api-docs/


* * *

## Alternate Usage

* To run as a server:

```js
npm start
```

* Browse to the root endpoint - showing server status:

* http://localhost:3100/

* Browse to the API Swagger Explorer: 

* http://localhost:3100/api-docs/


* * *

## Docker

### Build

```sh
npm run docker:build
```

```sh
 docker images | grep health
```

### Run 

* Confirm that Docker is running
* Make sure nothing else is running on the port

```sh
npm run docker:run
```

The port was loaded from the env.docker.list file:

Browse to:
* http://localhost:3100
* http://localhost:3100/api-docs/

or:

```sh
curl http://localhost:3100
```

### Rebuild and Run again

```sh
npm run docker:rerun
```

### Stop

```sh
npm run docker:stop
```

### Cleanup

```sh
npm run docker:clean
```

This does the same thing:

```sh
docker stop health-server
docker rm health-server
docker rmi json-health
```

* * *

## References

* https://scriptable.com/docker/how-to-publish-a-docker-container 
