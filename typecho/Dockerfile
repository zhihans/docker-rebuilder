FROM joyqi/typecho:nightly-php8.2-fpm-alpine

RUN apk add --no-cache tzdata nginx && \
    sed -i 's|listen = 9000|listen = /var/run/php-fpm.sock|' /usr/local/etc/php-fpm.d/zz-docker.conf && \
    echo "listen.owner = www-data" >> /usr/local/etc/php-fpm.d/zz-docker.conf && \
    echo "listen.group = www-data" >> /usr/local/etc/php-fpm.d/zz-docker.conf && \
    sed -i 's|php-fpm|php-fpm -D > /dev/null 2>\&1 \&\& nginx -g "daemon off;"|' /bin/init_typecho
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

COPY default.conf /etc/nginx/http.d/default.conf

EXPOSE 80
