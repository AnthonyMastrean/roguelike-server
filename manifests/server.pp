Exec['apt-update'] -> Package<| |>

Exec {
  logoutput => on_failure,
}

exec { 'apt-update':
  path    => ['/usr/bin'],
  command => 'apt-get update',
}

package { 'adom':
  ensure   => latest,
  provider => dpkg,
  source   => '/tmp/packages/adom_1.2.0-pre.23_amd64.deb',
}

roguelike::shell { 'adom':
  game    => '/usr/games/adom',
  require => Package['adom'],
}
