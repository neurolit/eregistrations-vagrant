# Simple Vagrant files for e-registrations

For now, it:
* provisions NodeJS
* provisions MongoDB

## Usage

In order to use these files, you'll need to [install Virtual Box and Vagrant](http://docs.vagrantup.com/v1/docs/getting-started/index.html).

Then, you can create a box and provision it:

	$ mkdir mybox && cd mybox/
	$ vagrant box add precise32 http://files.vagrantup.com/precise32.box
	$ vagrant init precise32
	$ vagrant up

Your box is running!