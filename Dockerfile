FROM holly/python-build:latest AS build-env

ENV DEBIAN_FRONTEND noninteractive
ENV LS_COLORS di=01;36

COPY app/ /app
WORKDIR /app
RUN chmod +x make_lambda_layer.sh \
 && mkdir python \
 && cd python \
 && pip install --no-cache-dir  -r ../requirements.txt -t ./ \
 && find ./ -type d -name __pycache__ | xargs rm -frv \
 && cd ../ 
#CMD [ "/bin/bash" ]
ENTRYPOINT ["/app/make_lambda_layer.sh"]
