FROM python:alpine
LABEL maintainer="x.yangtze.river@gmail.com"

ENV CRON_SIGNIN='30 9 * * *'
ENV MULTI=TRUE
ENV TZ=Asia/Shanghai

WORKDIR /var/app

RUN apk add --no-cache tzdata
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
VOLUME /var/app/config
CMD ["python3", "./docker.py" ]
