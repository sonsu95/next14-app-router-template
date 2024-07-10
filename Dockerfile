# Stage 1: Base with pnpm installed
FROM node:lts-alpine as base
RUN npm install -g pnpm

# Stage 2: Dependencies and application
WORKDIR /usr/src/app
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY . .

# Copy script and grant execution permissions
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3000

# Execute entrypoint script
ENTRYPOINT ["/entrypoint.sh"]