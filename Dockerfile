FROM busybox

ENV LOCATION=""
ENV USER=""
ENV PASSWORD=""
ENV ADDRESS=""

WORKDIR /tmp

COPY  . /tmp

ENTRYPOINT ./ocprometheus -config "${LOCATION}" -addr "${ADDRESS}" -username "${USER}"  -password "${PASSWORD}" -listenaddr 0.0.0.0:8081
