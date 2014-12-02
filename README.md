# dell-memcached

This image installs [Memcached](http://memcached.org/), an open-source high-performance, distributed memory caching system.

## Components
The stack comprises the following components:

Name       | Version | Description
-----------|---------|------------------------------
Memcached  | 1.4.14  | Memory caching system
Ubuntu     | Trusty  | Operating system

## Usage

### 1. Start the Container

#### A. Basic Usage

To start your container with:

* Port 11211 exposed (memcached)
* A named container (**memcached**)

Do:

```no-highlight
sudo docker run -d -p 11211:11211 --name memcached dell/memcached
```

The first time that you run your container, a new user `memcached` with all privileges,
and a random password, will be created in Memcached. To get the password, check the logs
of the container by running:

```no-highlight
docker logs memcached
```

You will see output like the following:

```no-highlight
========================================================================
You can now connect to this Memcached server using:
	
      USERNAME:admin      PASSWORD:h0znMbk3RkM8
	    
Please remember to change the above password as soon as possible!
========================================================================
```

In this case, `h0znMbk3RkM8` is the password assigned to the `admin` user.

#### B. Advanced Usage

Start your container with:

* Port 11211 exposed (memcached)
* A named container (**memcached**)
* A specific password for the admin account by setting the environment variable `MEMCACHED_PASS`

Do:

```no-highlight
sudo docker run -d -p 11211:11211 -e MEMCACHED_PASS="mypass" --name memcached dell/memcached
```

In this case, `mypass` is the password assigned to the `admin` user.

### 2. Testing with Python
First, install the Python `bmemcached` library on the host. To do this, use pip or easy_install:

```no-highlight
sudo pip install python-binary-memcached
```

Start python on the command line, and test your memcached installation as follows:

```no-highlight
>>> import bmemcached
>>> client = bmemcached.Client(('localhost:11211'),'admin','mypass')
>>> client.set('colourkey','red')
True
>>> print client.get('colourkey')
red
```

## Reference

### Image Details
Based on [tutum/memcached](https://github.com/tutumcloud/tutum-docker-memcached)

Pre-built Image | [https://registry.hub.docker.com/u/dell/memcached](https://registry.hub.docker.com/u/dell/memcached) 

