FROM python:3.8-slim

WORKDIR /usr/src

COPY requirements.txt ./
COPY whl/*.whl .
RUN pip install *.whl
RUN pip install --no-cache-dir -r requirements.txt

VOLUME [ "/usr/src/app/config/", "/usr/src/templates/" ]
COPY . .

CMD [ "python", "-u", "./main.py" ]
