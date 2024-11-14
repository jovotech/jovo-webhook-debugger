FROM node:16-alpine AS backend-builder

# Create app directory
WORKDIR /usr/src/app

# Copy the project into the contabuilder
COPY package.json package.json
COPY backend ./backend
COPY frontend ./frontend
COPY .prettierrc.js .prettierrc.js


# Install dependencies and compile the files
RUN cd /usr/src/app/backend && npm ci && npm run build
RUN cd /usr/src/app/frontend && npm ci && npm run build:prod && npm prune --production

EXPOSE 4000
