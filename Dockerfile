FROM ubuntu:20.04

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt-get -qq install -y aria2 python3 python3-pip \
    locales python3-lxml \
    curl pv jq ffmpeg
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
RUN chmod +x aria.sh

CMD ["bash","start.sh"]
