# Running the stack
Running with docker compose.
This is for development purposes, it is not configured as a 'production' ready environment.

## TL;DR

```bash
docker compose up
```

## Requirements

- [docker](https://docs.docker.com/)
- [docker compose](https://docs.docker.com/compose/) v2+

## Starting for the fist time

```bash
docker compose up
```

This starts the stack and exposes the frontend on http://localhost:8080.

## Keeping it up-to-date

To update your environment with the latest versions:

```bash
docker compose build --pull
docker compose up --build
```

A `compose build --pull` is needed to make docker pull the 'nested' dependencies inside the frontend/Dockerfile.

## Running it with a local develop version
During development of one or more parts of the stack, these can be 'swapped' out to use the locally runnning development versions.

 This is done with applying an additional compose config file. To apply these you need to give the full list of compose config files, including the default ones.


### Controller

Run the controller from its checkout source (which by default is http://localhost:4000).

```
COMPOSE_FILE=compose.yml;compose.override.yml:compose.local-controller.yml docker compose up
```


### Unity

When working in the editor make it connect to the http://localhost:8080 backend.
For testing a WebGL build, output it in `/tmp/u` and apply the compose.local-unity-editor-webgl.yml (on top of the default compose file, see above)


### Frontend (ui-client)

As this is the 'top' of the stack, no compose method is needed here.
Just run the development version from its own repo and configure it to communicate with http://localhost:8080 backend.


## Changing the versions (branch)

By default the `develop` versions of the container images are used. These can be changed by using environment variables. These can be set in the usual docker compose way, so with a `.env` file or by setting them in your shell environment.

```
VERSION_CONTROLLER=v2 docker compose up
```


## Cleanup

Remove 'everything':

```
docker compose down -v --rmi local
```
