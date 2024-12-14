FROM python:3.10.14-slim

WORKDIR /app

ENV TZ=Asia/Shanghai

COPY . .

RUN cp SmsCodeWebhook/settings_example.py SmsCodeWebhook/settings.py && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get update && \
    apt-get install -y redis-server && \
    apt-get clean

CMD ["bash", "start.sh"]
