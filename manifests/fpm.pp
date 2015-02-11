Exec['apt-update'] -> Package<| |>

exec { 'apt-update':
  path    => ['/usr/bin'],
  command => 'apt-get update',
}

exec { 'gem install bundler':
	path    => ['/usr/bin', '/opt/vagrant_ruby/bin'],
	require => [
		File['/etc/gemrc'],
		Package['ruby-dev'],
	],
}

file { '/etc/gemrc':
	ensure  => present,
	owner   => root,
	group   => root,
	content => "gem: --no-rdoc --no-ri\n",
}

package { [
  'gcc',
  'rpm',
  'ruby-dev',
  'make',
  'tar',
  'wget']:
  ensure => latest,
}
