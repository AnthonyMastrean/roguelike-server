class roguelike-crawl() {
  $package = 'crawl-0.15'
  $target = '/usr/games/crawl'

  exec { 'crawl update':
    path    => ['/usr/bin'],
    command => 'apt-get update',
  }

  file { 'crawl.list':
    path    => '/etc/apt/sources.list.d/crawl.list',
    owner   => root,
    group   => root,
    mode    => 'a=r,u+w',
    content => 'deb http://crawl.develz.org/debian crawl 0.15',
  }

  exec { 'wget crawl.develz.org':
    path    => ['/bin', '/usr/bin'],
    command => "bash -c 'wget http://crawl.develz.org/debian/pubkey -O - | apt-key add -'",
    unless  => "bash -c 'apt-key list | grep crawl.develz.org'",
    require => File['crawl.list'],
    notify  => Exec['crawl update'],
  }

  package { 'crawl':
    require => Exec['wget crawl.develz.org'],
  }

}
