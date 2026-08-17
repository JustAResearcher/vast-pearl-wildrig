FROM ubuntu:22.04

ARG WILDRIG_VERSION=0.50.1
ARG WILDRIG_SHA256=9f22e6291dbb4ec922d9698828afcf28502b8ffff9db83f52ee3d56475f66317

ADD --checksum=sha256:${WILDRIG_SHA256} \
    https://github.com/andru-kun/wildrig-multi/releases/download/${WILDRIG_VERSION}/wildrig-multi-linux-${WILDRIG_VERSION}.tar.gz \
    /tmp/wildrig.tar.gz

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates \
        ocl-icd-libopencl1 \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /opt/wildrig \
    && tar -xzf /tmp/wildrig.tar.gz -C /opt/wildrig wildrig-multi \
    && rm /tmp/wildrig.tar.gz \
    && chmod 0755 /opt/wildrig/wildrig-multi

ENV NVIDIA_VISIBLE_DEVICES=all \
    NVIDIA_DRIVER_CAPABILITIES=compute,utility

WORKDIR /opt/wildrig
STOPSIGNAL SIGTERM
ENTRYPOINT ["/opt/wildrig/wildrig-multi"]
CMD ["--help"]

LABEL org.opencontainers.image.title="Vast Pearl WildRig idle job" \
      org.opencontainers.image.source="https://github.com/JustAResearcher/vast-pearl-wildrig" \
      org.opencontainers.image.url="https://github.com/andru-kun/wildrig-multi" \
      org.opencontainers.image.version="0.50.1"
