FROM python:3.10-bookworm AS build-env

ENV DEBIAN_FRONTEND noninteractive
ENV LS_COLORS di=01;36

COPY app/ /app
WORKDIR /app
RUN --mount=type=cache,target=/var/lib/apt/lists --mount=type=cache,target=/var/cache/apt/archives \
    apt update \
 && apt -y install zip \
 && mkdir python \
 && cd python \
 && pip install --no-cache-dir  -r ../requirements.txt -t ./ \
 && find ./ -type d -name __pycache__ | xargs rm -frv \
 && cd ../ 

CMD [ "/bin/bash" ]
