# Temel Python image
FROM python:3.10-slim

# FFmpeg kur
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

# Çalışma dizini oluştur
WORKDIR /app

# Gereksinimleri yükle
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Tüm dosyaları kopyala
COPY . .

# Port ayarla
ENV PORT=8000

# Uygulamayı başlat
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "main:app"]
