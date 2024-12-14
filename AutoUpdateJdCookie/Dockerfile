FROM python:3.10.14-slim

WORKDIR /app

ENV TZ=Asia/Shanghai

COPY . .

RUN pip install --no-cache-dir -r requirements.txt && \
    playwright install chromium && \
    playwright install-deps

CMD ["python", "schedule_main.py"]
