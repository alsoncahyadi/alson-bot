FROM alpine:latest

LABEL Author="alson.cahyadi@gmail.com"

# Install python and pip
RUN apk add --no-cache --update python3 py3-pip bash
COPY ./requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip3 install --no-cache-dir -q -r /tmp/requirements.txt

COPY . /opt/webapp/
WORKDIR /opt/webapp

RUN chmod +x boot.sh

# CMD exec gunicorn --access-logfile - --error-logfile - main:app
CMD exec gunicorn -b :$PORT --access-logfile - --error-logfile - main:app
# CMD exec python3 main.py