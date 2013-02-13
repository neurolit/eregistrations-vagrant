class nodejs {
	
	package { 'python-software-properties':
		ensure => present,
		require => Exec['apt-get update'],
	}

	exec { 'add-apt-repository ppa:chris-lea/node.js':
		command => '/usr/bin/add-apt-repository ppa:chris-lea/node.js && /usr/bin/apt-get update',
		require => Package['python-software-properties'],
	}

	exec { 'apt-get update':
		command => '/usr/bin/apt-get update',
	}

	package { 'nodejs':
		ensure => present,
		require => Exec['add-apt-repository ppa:chris-lea/node.js'],
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
		command => '/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10',
	}

	Exec['apt-key add mongodb'] -> File['/etc/apt/sources.list.d/10gen.list'] -> Exec['apt-get update'] -> Package['mongodb-10gen']
}

include nodejs
include mongodb