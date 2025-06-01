FROM alpine:latest

USER root

ENV PORT=7860

EXPOSE ${PORT}
    
WORKDIR /app

COPY . .

RUN apk update &&\
    apk add --no-cache bash curl unzip nginx supervisor zsh &&\
    chmod +x ./entrypoint.sh

CMD [ "/app/entrypoint.sh" ]
