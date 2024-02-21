FROM debian:10

# pacotes necessários
RUN apt-get update && apt-get install -y \
    gnupg2 \
    net-tools \
    dphys-swapfile \
    wget \
    systemd \
    systemd-sysv \
    telnet \
    vim \
    && rm -rf /var/lib/apt/lists/*

# repositório 3CX PBX e Debian
RUN wget -O- http://downloads.3cx.com/downloads/3cxpbx/public.key | apt-key add -

RUN echo "deb http://downloads-global.3cx.com/downloads/debian buster main" | tee /etc/apt/sources.list.d/3cxpbx.list

RUN echo "deb http://deb.debian.org/debian/ bullseye main" >> /etc/apt/sources.list \
    && echo "deb-src http://deb.debian.org/debian/ bullseye main" >> /etc/apt/sources.list

RUN apt-get update

# iniciar systemd
CMD ["/lib/systemd/systemd"]
