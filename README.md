# Boilerplate template for a containerized static Svelte/Sveltekit application

Svelte template generated using SvelteKit as per the Svelte [docs](https://svelte.dev/docs/svelte/getting-started).
- Uses the Svelte static adapter and generates a static SPA on build.
- Includes a Dockerfile and .dockerignore for containerization.
- Includes an example on using environment variables files when building and/or running images.
- Uses nginx to serve the frontend when running as a container.

## Developing

You need Nodejs installed to build and run the app on your dev machine.

First, install dependencies
```sh
npm install
```

Then rename/copy the .env.template file to .env.

Start a development server:
```sh
npm run dev
```

## Building an image

Building Docker images requires [Docker Engine](https://docs.docker.com/engine/install/).

This boilerplate expects one buildtime .env variable, BUILD_TIME_VAR.
It solely serves as an example on injecting environment variables in build time.

Run the following command from the project root to build the image:
```sh
docker build --build-arg BUILD_TIME_VAR=<my-value> -t <image-name> . 
```

## Running the image as a container

After building the image, you can run it as a container.
The project expects one runtime variable, the API_URL representing the location of the backend.

Run the command below from the project root to run the image. This assumes that your backend is running on your dev machine.
```sh
docker run --add-host=host.docker.internal:host-gateway -e API_URL=http://host.docker.internal:<backend-port> -p 8080:80 <image-name> 
```

## Usage of the boilerplate

You're free to use this any way you'd like. I'm interested to see if anyone does - if you actually make something useful out of this boilerplate let me know on the [Github repository](https://github.com/Donderstal/svelte-sveltekit-docker-boilerplate). 