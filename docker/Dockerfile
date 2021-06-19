FROM alpine
RUN apk add --no-cache curl wget busybox-extras netcat-openbsd python3 py-pip bash && \
    pip install awscli
CMD tail -f /dev/null
