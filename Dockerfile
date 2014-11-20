FROM ubuntu:trusty
MAINTAINER Dell Cloud Market Place <Cloud_Marketplace@dell.com>

RUN apt-get update

# Install memcached
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libevent-dev 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libsasl2-2 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install sasl2-bin 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libsasl2-2 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libsasl2-dev 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libsasl2-modules
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install memcached=1.4.14-0ubuntu9
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install pwgen

# Add script to create admin user
ADD create_memcached_admin_user.sh /create_memcached_admin_user.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 11211

CMD ["/run.sh"]
