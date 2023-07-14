# Use Node.js version 16 as base
FROM node:16-alpine
# Set working directory
WORKDIR /app
# Copy package.json and package-lock.json to the container
COPY package*.json ./
# Install dependencies
RUN npm install
# Copy all other application files to the container
COPY . .
# Build the application
RUN npm run build
# Remove development dependencies
RUN npm prune



# Use a multi-stage build to create a smaller final image
FROM node:16-alpine
# Set working directory
WORKDIR /app
# Copy only the necessary files from the build stage
COPY --from=0 /app/node_modules ./node_modules
COPY --from=0 /app/dist ./dist
# Expose the port used by the application
EXPOSE 3042
# Start the application
CMD ["node", "dist/main"]
