# M3U8 / Video Downloader

Paste a webpage URL or `.m3u8` link → get thumbnail + video link → download as MP4.

## Deploy

Docker-based. Listens on `$PORT` (default 7860).

## Speed

- 16 parallel HLS fragment downloads
- aria2c multi-connection with automatic fallback
- Live progress bar + ETA in the UI
