FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1 \
    PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

WORKDIR /app

# ffmpeg = m3u8 → mp4 merging | aria2 = multi-connection downloader
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    aria2 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

RUN playwright install --with-deps chromium

COPY . .

CMD ["sh", "-c", "gunicorn -w 1 --threads 4 -b 0.0.0.0:${PORT:-7860} --timeout 600 app:app"]
