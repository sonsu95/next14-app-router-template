#!/bin/sh

if [ "$NODE_ENV" = "production" ]; then
    echo "Running in production mode"
    pnpm run build
    pnpm prune --prod
    pnpm run start
else
    echo "Running in development mode"
    pnpm run dev
fi