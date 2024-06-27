FROM golang:1.18.6-alpine as builder
#ENV CGO_ENABLED=0
COPY . /flowerss
ENV TZ=Asia/Shanghai
RUN apk add --no-cache tzdata
RUN apk add git make gcc libc-dev && \
    cd /flowerss && make build

# Image starts here
FROM alpine
ENV TZ=Asia/Shanghai
RUN apk add --no-cache tzdata
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /flowerss/flowerss-bot /bin/
VOLUME /root/.flowerss
WORKDIR /root/.flowerss
ENTRYPOINT ["/bin/flowerss-bot"]

