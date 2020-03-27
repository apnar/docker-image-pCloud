FROM ubuntu:xenial

# install prerequisites
RUN DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y libfuse2 libc-bin fuse wget \
 && wget https://vc536.pcloud.com/dHZvVaD6QZ8ow4zYZDHMGZZiyn1a7Z2ZZ3vVZkZvLyi7ZllWGAwFf0GQ9kW2rEUrdIhYV0I0X/pcloudcc_2.1.0-1_amd64_ubuntu_18.04.deb \
 && dpkg -i pcloudcc_2.1.0-1_amd64_ubuntu_18.04.deb \
 && rm -f pcloudcc_2.1.0-1_amd64_ubuntu_18.04.deb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Add startup script
COPY start.sh /

# Start Ganesha NFS daemon by default
CMD ["/start.sh"]

