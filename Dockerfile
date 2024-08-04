# Use an official Node runtime as a parent image
FROM node:latest as build

# Set the working directory
WORKDIR /app

# Copy the package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular app
RUN npm run build

# Use an NGINX image to serve the built app
FROM nginx:latest
COPY --from=build /app/dist/cicd-app-demo/browser /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
