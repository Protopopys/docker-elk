ARG PYTHON_VERSION=${PYTHON_VERSION:-3.7}
FROM python:${PYTHON_VERSION}-alpine3.9
LABEL maintainer="Protopopys <protopopys@gmail.com>"
ARG CURATOR_VERSION=${CURATOR_VERSION:-5.6.0}

RUN pip install  elasticsearch-curator==${CURATOR_VERSION} \
 && rm -rf /var/cache/apk/*
COPY ./config/ /config
RUN echo -e '0 0 * * * curator --config /config/config_file.yml /config/action_file.yml' >> /config/crontab.txt \
 && /usr/bin/crontab /config/crontab.txt

CMD ["/usr/sbin/crond","-f"]