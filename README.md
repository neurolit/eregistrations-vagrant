# Vagrant configuration files for *eRegistrations*

## What are they made for?

The primary audience is **developers** of *eRegistrations*. With these Vagrant configuration files, you can create a virtual box, in which you can run install and *eRegistrations* on your personal computer without hassle (hopefuly).

## What do they do?

For now, it:

* creates a Linux Ubuntu 12.04 virtual box
* configures the Box (network + symbolic links allowed)
* installs NodeJS, MongoDB in the virtual box
* installs dependencies for building *eRegistrations* in the virtual box: make, g++, openssl, npm
* installs dependencies for running *eRegistrations* in the virtual box: GraphicsMagick, Ghostscript

## Installation of your virtual box

In order to use these files, you'll need to [install Virtual Box and Vagrant](http://docs.vagrantup.com/v1/docs/getting-started/index.html).

After that, download this repository (it will create a mbox directory) :

```shell
$ git clone git://github.com/neurolit/eregistrations-vagrant.git mybox
```

Then, you can create a box and provision it:

```shell
$ cd mybox/
$ vagrant box add precise32 http://files.vagrantup.com/precise32.box
$ vagrant init precise32
$ vagrant up
```

**Congratulations, your box is running!**

You should be able to install eRegistrations, as [explained in the *eRegistrations* README](https://github.com/egovernment/eregistrations/blob/demo/README.md). A summary describes it quickly just behind.

## Installation of *eRegistrations*

Download *eRegistrations* code and put it into mybox directory.

```shell
$ cd mybox/
$ git clone git://github.com/egovernment/eregistrations.git
```

Create the env.json file according to *eRegistrations* README file.

```
$ cd mybox/eregistrations
```

Here is an example, which should work out-of-the-box:

```json
{
	"dev": true,
	"url": "http://192.168.33.10",
	"port": 3177,
	"db": {
		"name": "eregistrations",
		"host": "localhost",
		"port": 27017,
		"collection": "eregistrations"
	}
}
```

###Linux/MacOSX

Connect to your virtual box, and follow the [*eRegistrations* README](https://github.com/egovernment/eregistrations/blob/demo/README.md):

```shell
$ cd mybox/
$ vagrant ssh
$ cd /vagrant/eregistrations
$ npm rebuild
	...
```

###Windows

Connect to your virtual box, and follow the *eRegistrations* README.

An SSH client is generally not distributed with Windows by default. Because of this, if you are on Windows, Vagrant will instead output SSH authentication info which you can use with your favorite SSH client, such as [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/).

PuTTY may not recognize the `insecure_private_key` provided by vagrant as a valid private key. To remedy this, first grab the [PuTTYgen app](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html). Then use PuTTYgen and import the `insecure_private_key` (found in the .vagrant.d dir in your home directory) and save a ppk file from that private key. Use the ppk file instead of the default one when SSHing into your vagrant box.

If asked, the password and username are "vagrant".

### Running it

```shell
$ npm run-script setup
$ npm start
```

With your browser, connect to [http://192.168.33.10:3177](http://192.168.33.10:3177).

## Notes

* The directory in which you ran `vagrant init precise32` and cloned *eRegistrations* repository is `/vagrant` in your virtual box.
* `192.168.33.10` is the local IP address of your virtual box, as defined by `Vagrantfile`.