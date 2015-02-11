Exec['apt-update'] -> Package<| |>

exec { 'apt-update':
  path    => ['/usr/bin'],
  command => 'apt-get update',
}

exec { 'gem-bundler':
  path    => ['/usr/bin'],
  command => 'gem install bundler',
  require => [
    File['/etc/gemrc'],
    Package['ruby', 'rubygems'],
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
  'ruby',
  'rubygems',
  'ruby-dev',
  'make',
  'tar',
  'wget']:
  ensure => latest,
}
