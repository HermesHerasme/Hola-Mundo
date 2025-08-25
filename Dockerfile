# Imagen base liviana
FROM python:3.12-slim

# Evita *.pyc y fuerza stdout/err sin buffer
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Carpeta de trabajo
WORKDIR /app

# Instala dependencias del sistema mínimas (seguridad/compilación)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Copia requirements e instala (cachea capas)
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copia el código
COPY . .

# Expone el puerto
EXPOSE 8000

# Comando de arranque (prod)
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:8000", "app:app"]