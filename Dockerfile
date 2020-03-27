FROM ubuntu:xenial

# install prerequisites
RUN DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y libfuse2 libc-bin fuse wget \
 && wget `wget -q -O - https://my.pcloud.com/publink/show\?code\=XZvLyi7Zsz7t1H0aYIFiawL4LSgN3uxLBUJX  | grep downloadlink | sed -e 's/.*https/https/' -e 's/".*//' -e 's/\\\\//g'` \
 && dpkg -i pcloudcc_2.1.0-1_amd64_ubuntu_18.04.deb \
 && rm -f pcloudcc_2.1.0-1_amd64_ubuntu_18.04.deb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Add startup script
COPY start.sh /

# Start Ganesha NFS daemon by default
CMD ["/start.sh"]

