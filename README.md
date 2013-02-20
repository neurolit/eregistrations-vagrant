# Simple Vagrant files for eRegistrations

For now, it:
* provisions NodeJS, MongoDB
* provisions dependencies for building eRegistrations: make, g++, openssl, npm
* provisions dependencies for running eRegistrations: ImageMagick, Ghostscript
* configures the Box (network + symbolic links allowed)

## Usage

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

Your box is running!

## Installation of eRegistrations

Download eRegistrations code and put it into mybox directory.

```shell
$ cd mybox/
$ git clone git://github.com/egovernment/eregistrations.git
```

Create the env.json file according to eRegistrations README file.

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

###LINUX/MacOSX

Connect to your virtual box, and follow the [eRegistrations README](https://github.com/egovernment/eregistrations/blob/demo/README.md):

```shell
$ cd mybox/
$ vagrant ssh
$ cd /vagrant/eregistrations
$ npm rebuild
	...
```

###Windows

Connect to your virtual box, and follow the eRegistrations README.

An SSH client is generally not distributed with Windows by default. Because of this, if you are on Windows, Vagrant will instead output SSH authentication info which you can use with your favorite SSH client, such as [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/).

PuTTY may not recognize the `insecure_private_key` provided by vagrant as a valid private key. To remedy this, first grab the [PuTTYgen app](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html). Then use PuTTYgen and import the `insecure_private_key` (found in the .vagrant.d dir in your home directory) and save a ppk file from that private key. Use the ppk file instead of the default one when SSHing into your vagrant box.

The password and username should be "vagrant".

## Running it

```shell
$ npm run-script setup
$ npm start
```

With your browser, connect to http://192.168.33.10:3177

## Notes

Please notice that the mybox directory will be found at /vagrant in your virtual box.