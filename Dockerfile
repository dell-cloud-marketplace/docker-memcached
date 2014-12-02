FROM ubuntu:trusty
MAINTAINER Dell Cloud Market Place <Cloud_Marketplace@dell.com>

# Update packages
RUN apt-get update
    
# Set the environment variable for package install
ENV DEBIAN_FRONTEND noninteractive

# Install memcached
RUN apt-get -y install \
    libevent-dev \
    libsasl2-2 \
    sasl2-bin \
    libsasl2-2 \
    libsasl2-dev \
    libsasl2-modules \
    memcached=1.4.14-0ubuntu9 \
    pwgen

# Add the script to create admin user
ADD create_memcached_admin_user.sh /create_memcached_admin_user.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 11211

CMD ["/run.sh"]
