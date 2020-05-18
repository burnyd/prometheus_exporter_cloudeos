FROM busybox

ENV LOCATION=""
ENV USER=""
ENV PASSWORD=""
ENV ADDRESS=""

WORKDIR /tmp

COPY  . /tmp

ENTRYPOINT ./ocprometheus -config "${LOCATION}" -addr "${ADDRESS}" -username "${USER}"  -password "${PASSWORD}"
