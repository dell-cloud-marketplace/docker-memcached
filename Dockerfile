FROM ubuntu:trusty
MAINTAINER Dell Cloud Market Place <Cloud_Marketplace@dell.com>

RUN apt-get update

# Install memcached
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install memcached 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install pwgen

# Add script to create admin user
ADD create_memcached_admin_user.sh /create_memcached_admin_user.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 11211

CMD ["/run.sh"]
