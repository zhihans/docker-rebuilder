FROM alpine:latest

ENV TZ=Asia/Shanghai

RUN printf "%s%s%s%s\n" \
        "@nginx " \
        "http://nginx.org/packages/mainline/alpine/v" \
        "$(egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release)" \
        "/main" \
    >> /etc/apk/repositories && \
    wget -O /etc/apk/keys/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub

RUN apk add --no-cache tzdata nginx@nginx nginx-module-acme@nginx
RUN sed -i '1i load_module modules/ngx_http_acme_module.so;' /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]
