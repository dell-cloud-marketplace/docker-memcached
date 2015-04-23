FROM ubuntu:trusty
MAINTAINER Dell Cloud Market Place <Cloud_Marketplace@dell.com>

# Update packages
RUN apt-get update

# Ensure UTF-8
RUN locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    export LC_ALL=en_US.UTF-8 && \
    export LANGUAGE=en_US.UTF-8 && \
    export LANG=en_US.UTF-8
    
# Install packages
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
    libevent-dev \
    libsasl2-2 \
    sasl2-bin \
    libsasl2-2 \
    libsasl2-dev \
    libsasl2-modules \
    memcached \
    pwgen

# Add the script to create admin user
COPY create_memcached_admin_user.sh /create_memcached_admin_user.sh
COPY run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 11211

CMD ["/run.sh"]
