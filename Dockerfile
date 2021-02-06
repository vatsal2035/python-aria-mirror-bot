FROM ubuntu:20.04

WORKDIR /usr/src/app
COPY requirements.txt .
RUN apt-get -qq install -y aria2 python3 python3-pip
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
COPY netrc /root/.netrc
RUN chmod +x aria.sh

CMD ["bash","start.sh"]
