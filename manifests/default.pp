class nodejs {
	
	package { 'python-software-properties':
		ensure => present,
		require => Exec['apt-get update'],
	}

	exec { 'add-apt-repository ppa:chris-lea/node.js-legacy':
		command => '/usr/bin/add-apt-repository ppa:chris-lea/node.js-legacy && /usr/bin/apt-get update',
		require => Package['python-software-properties'],
	}

	exec { 'apt-get update':
		command => '/usr/bin/apt-get update',
	}

	package { 'nodejs':
		ensure => present,
		require => Exec['add-apt-repository ppa:chris-lea/node.js-legacy'],
	}

	package { 'npm':
		ensure => present,
		require => Exec['add-apt-repository ppa:chris-lea/node.js-legacy'],
	}
}

class mongodb {
	package { 'mongodb-10gen':
		ensure => present,
	}

	file { '/etc/apt/sources.list.d/10gen.list':
		content => 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen',
		mode => '0644',
		owner => 'root',
		group => 'root',
	}

	exec { 'apt-key add mongodb':
		command => '/usr/bin/apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10',
	}

	Exec['apt-key add mongodb'] -> File['/etc/apt/sources.list.d/10gen.list'] -> Exec['apt-get update'] -> Package['mongodb-10gen']
}

class bcrypt {
	package { 'make':
		ensure => present,
	}

	package { 'g++':
		ensure => present,
	}

	package { 'openssl':
		ensure => present,
	}
}

class images {
	package { 'graphicsmagick':
		ensure => present,
	}

	package { 'ghostscript':
		ensure => present,
	}
}

include nodejs
include mongodb
include bcrypt
include images