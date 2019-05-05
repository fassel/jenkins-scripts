FROM alpine:latest

WORKDIR /app

ARG app_name

RUN apk add --no-cache tzdata
RUN cp /usr/share/zoneinfo/UTC /etc/localtime
RUN echo "UTC" >  /etc/timezone

ADD ./ ./

ENV app_name_env=$app_name

ENTRYPOINT /app/$app_name_env
