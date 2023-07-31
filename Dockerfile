FROM python:3.8-slim

WORKDIR /usr/src

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libffi-dev \
    libssl-dev
    
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

VOLUME [ "/usr/src/app/config/", "/usr/src/app/templates/" ]
COPY . .

CMD [ "python", "-u", "./main.py" ]
