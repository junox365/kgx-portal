FROM node:12-alpine

WORKDIR /workdir

RUN apk update && apk add npm

EXPOSE 8080

CMD ["/bin/sh"]