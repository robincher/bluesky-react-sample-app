FROM node:14.17.0-alpine3.13

#Install utilities
RUN apk update && apk --no-cache add curl busybox-extras g++ make

WORKDIR /usr/src/app
COPY package*.json ./
RUN yarn cache clean && yarn --update-checksums
COPY . ./
EXPOSE 3000
CMD ["yarn", "start"]


