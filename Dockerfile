FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1

WORKDIR /app

ADD . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080
# Define environment variable
ENV NAME World
# Run the application
CMD ["gunicorn", "myproject.wsgi", "--bind", "0.0.0.0:8080"]