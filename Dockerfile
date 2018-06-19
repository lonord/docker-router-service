FROM ubuntu:16.04
LABEL maintainer="Loy B. <lonord.b@gmail.com>"
ENV VERSION 1.1
RUN apt-get update \
	&& apt-get install -y --no-install-recommends wget bridge-utils net-tools iptables dnsmasq \
	&& ARCH="$(dpkg --print-architecture)" \
	&& wget --no-check-certificate "https://github.com/lonord/router-service/releases/download/v${VERSION}/router-service_v${VERSION}_${ARCH}.deb" \
	&& dpkg -i "router-service_v${VERSION}_${ARCH}.deb" \
	&& rm "router-service_v${VERSION}_${ARCH}.deb" \
	&& apt-get purge -y --auto-remove wget -y \
	&& rm -rf /var/lib/apt/lists/*
CMD [ "router-service" ]