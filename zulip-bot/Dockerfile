# You can specify this in docker-compose.yml or with
# docker build --build-args "PYTHON_VERSION=<python version>".
ARG PYTHON_VERSION=3.7

FROM  python:${PYTHON_VERSION}-slim

RUN pip install --no-cache-dir zulip_botserver zulip_bots
RUN echo $HOSTNAME

EXPOSE 5002
VOLUME ["/data"]

COPY entrypoint.sh /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
