FROM python:3.10.14-slim

WORKDIR /app

ENV TZ=Asia/Shanghai

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt && \
    apt update && \
    apt install chromium -y
