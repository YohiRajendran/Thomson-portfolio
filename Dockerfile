
# Stage 1: Build the frontend
FROM node:20-alpine AS build

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Build production files
RUN npm run build

# expose application port

EXPOSE 3000

CMD ["npm","run","dev"]
