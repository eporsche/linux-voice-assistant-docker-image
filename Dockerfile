
FROM python:3.13-slim-trixie

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    avahi-utils alsa-utils libportaudio2 portaudio19-dev \
    build-essential libmpv-dev git pulseaudio pulseaudio-utils

WORKDIR /srv
RUN git clone https://github.com/OHF-Voice/linux-voice-assistant.git .
RUN ./script/setup

ENTRYPOINT ["./script/run"]