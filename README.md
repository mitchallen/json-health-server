json-health-server
==

## Usage

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
