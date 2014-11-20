dell-memcached
======================


Memcached is a high-performance, distributed memory caching system.

## Components

The stack comprises the following components:

Name       | Version                   | Description
-----------|---------------------------|------------------------------
RabbitMQ   | 1.4.14                    | Memory caching system
Ubuntu     | Trusty                    | Operating system

## Usage

### 1. Start the Container

#### A. Basic Usage

Start your container with:

* Port 11211 exposed (memcached)
* A named container (**memcached**)

	sudo docker run -d -p 11211:11211 --name memcached dell/memcached

The first time that you run your container, a new user `memcached` with all privileges 
will be created in Memcached with a random password. To get the password, check the logs
of the container by running:

	docker logs memcached

You will see an output like the following:

	========================================================================
    You can now connect to this Memcached server using:
	
          USERNAME:admin      PASSWORD:h0znMbk3RkM8
	    
	Please remember to change the above password as soon as possible!
	========================================================================

In this case, `h0znMbk3RkM8` is the password assigned to the `admin` user.

Done!

#### B. Advanced Usage

Start your container with:

* Port 11211 exposed (memcached)
* A named container (**memcached**)
* A specific password for the admin account by setting the environment variable `MEMCACHED_PASS`

	sudo docker run -d -p 11211:11211 -e MEMCACHED_PASS="mypass" --name memcached dell/memcached
	
In this case, `mypass` is the password assigned to the `admin` user.


### 2. Testing with Python


First, install `bmemcached`. To do this, use pip or easy_install:

    sudo pip install python-binary-memcached

To test your memcached installation, run the `python` command as follows:

```no-highlight
python
>>> import bmemcached
>>> client = bmemcached.Client(('localhost:11211',),'admin','<admin_password>')
>>> client.set('key','value')
True
>>> print client.get('key')
value
```
## Reference

### Image Details

Inspired by [tutum/memcached](https://github.com/tutumcloud/tutum-docker-memcached)

Pre-built Image | [https://registry.hub.docker.com/u/dell/memcached](https://registry.hub.docker.com/u/dell/memcached) 

