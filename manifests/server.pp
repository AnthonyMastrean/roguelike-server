Exec['apt-update'] -> Package<| |>

exec { 'apt-update':
  path    => ['/usr/bin'],
  command => 'apt-get update',
}

package { 'angband':
  ensure => latest,
}

package { 'crawl':
  ensure => latest,
}

package { 'adom':
  ensure          => latest,
  provider        => rpm,
  source          => '/tmp/packages/adom-1.2.0_pre23-1.x86_64.rpm',
  install_options => ['-ihv'],
}

roguelike::shell { 'adom':
  game    => '/usr/games/adom',
  require => Package['adom'],
}

roguelike::shell { 'angband':
  game    => '/usr/games/angband',
  args    => '-mgcu',
  require => Package['angband'],
}

roguelike::shell { 'crawl':
  game    => '/usr/games/crawl',
  require => Package['crawl'],
}
