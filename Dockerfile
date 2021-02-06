FROM ubuntu:20.04

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt-get -qq update
RUN apt-get -qq install -y aria2 python3 python3-pip
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
COPY netrc /root/.netrc
RUN chmod +x aria.sh

CMD ["bash","start.sh"]
