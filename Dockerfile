FROM nvidia/cuda:12.1.0-cudnn8-runtime-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Seoul

WORKDIR /mydonut

RUN apt-get update && \
    apt-get install -y python3-pip python3-dev python-is-python3 pkg-config libmysqlclient-dev tzdata libgl1-mesa-glx && \
    rm -rf /var/lib/apt/lists/*

ADD ./requirements.txt /mydonut/requirements.txt

RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Set the command to run the application
CMD ["sh", "-c", "tail -f /dev/null"]
