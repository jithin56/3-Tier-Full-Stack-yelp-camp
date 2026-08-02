FROM node:20-alpine as build
WORKDIR /app
COPY package*.json .
RUN npm install
EXPOSE 3000
COPY . .

FROM node:20-alpine as production
WORKDIR /app
USER node
COPY --from=build --chown=node:node /app ./
CMD ["npm","start"]
