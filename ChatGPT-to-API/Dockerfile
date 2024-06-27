# https://github.com/slippersheepig/ChatGPT-to-API-Railway/blob/main/Dockerfile
# https://github.com/xqdoo00o/ChatGPT-to-API/blob/master/README_ZH.md
FROM golang:alpine AS builder
ENV CGO_ENABLED=0
ENV TZ=Asia/Shanghai
RUN apk add ca-certificates tzdata
COPY . /cta
RUN cd /cta && go build


FROM alpine
ENV TZ=Asia/Shanghai
ENV GIN_MODE=release
RUN apk add --no-cache tzdata
COPY --from=builder /cta/freechatgpt /bin/
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
WORKDIR /app
VOLUME /app
CMD [ "/bin/freechatgpt" ]
