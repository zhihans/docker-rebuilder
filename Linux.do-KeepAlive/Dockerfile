FROM python:3.10-alpine

WORKDIR /app

ENV TZ=Asia/Shanghai

COPY . .

RUN pip install --no-cache-dir selenium==4.23.1 requests && \
    apk add --no-cache chromium chromium-chromedriver tzdata && \
    mkdir cron && \
    echo "0 9 * * * cd /app && python Linux.do.py" > cron/root

CMD crond -f -c /app/cron
