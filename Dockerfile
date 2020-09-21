FROM alpine
RUN apk add stunnel

COPY entrypoint.sh .
ENTRYPOINT sh entrypoint.sh
