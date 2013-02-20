# Simple Vagrant files for e-registrations

For now, it:
* provisions NodeJS, MongoDB
* provisions dependencies for building E-Registrations: make, g++, openssl, npm
* provisions dependencies for running E-Registrations: ImageMagick, Ghostscript
* configures the Box (network + symbolic links allowed)

## Usage

In order to use these files, you'll need to [install Virtual Box and Vagrant](http://docs.vagrantup.com/v1/docs/getting-started/index.html).

After that, download this repository (it will create a mbox directory) :

	$ git clone git://github.com/neurolit/eregistrations-vagrant.git mybox

Then, you can create a box and provision it:

	$ cd mybox/
	$ vagrant box add precise32 http://files.vagrantup.com/precise32.box
	$ vagrant init precise32
	$ vagrant up

Your box is running!

## Installation of e-registrations

* Download e-registrations code and put it into mybox directory.

	$ cd mybox/
	$ git clone git://github.com/egovernment/eregistrations.git

* Create the env.json file according to e-registrations README file.

	$ cd mybox/eregistrations
	$ vi env.json

* Connect to your virtual box, and follow the e-registrations README:

	$ cd mybox/
	$ vagrant ssh
	$ cd /vagrant/eregistrations
	$ npm rebuild
	...

## Notes

Please notice that the mybox directory will be found at /vagrant in your virtual box.