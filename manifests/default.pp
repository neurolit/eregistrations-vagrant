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

include nodejs