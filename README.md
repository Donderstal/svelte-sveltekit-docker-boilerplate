# Boilerplate template for a containerized static Svelte/Sveltekit application

Svelte template generated using SvelteKit as per the Svelte [docs](https://svelte.dev/docs/svelte/getting-started).
Uses the Svelte static adapter.
Includes a Dockerfile and .dockerignore for containerization.
Added a .env file te give an example on using .env files when building and/or running images.

## Developing

Once you've created a project and installed dependencies with `npm install` (or `pnpm install` or `yarn`), start a development server:

```sh
npm run dev

# or start the server and open the app in a new browser tab
npm run dev -- --open
```

## Building an image

Building Docker images requires [Docker Engine](https://docs.docker.com/engine/install/).
This boilerplate expects one .env variable, API_URL. 
The .dockerignore is configured to ignore .env files, so you need to supply .env variables manually.  
Run the following command from the project root to build the image.

```sh
docker build --build-arg API_URL=<my-value> -t <image-name> . 
```

## Running the image as a container

After building you image, you can run it as a container.
Run the following command from the project root to build and image

```sh
docker run -p 8080:80 <image-name> . 
```