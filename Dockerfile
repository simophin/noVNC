FROM node

WORKDIR /app

EXPOSE 6080
ENV REMOTE_HOST localhost
ENV REMOTE_PORT 5901

RUN apt-get -y update && \
        apt-get -y install net-tools python-numpy && \
        apt-get -y clean

COPY . /app

ENTRYPOINT utils/launch.sh --vnc $REMOTE_HOST:$REMOTE_PORT --listen 6080
