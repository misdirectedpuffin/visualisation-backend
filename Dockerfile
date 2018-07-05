FROM node:9-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./package.json .
COPY ./yarn.lock .

RUN yarn --pure-lockfile

ARG NODE_ENV=production
RUN yarn install

COPY . .

CMD [ "yarn", "start" ]
