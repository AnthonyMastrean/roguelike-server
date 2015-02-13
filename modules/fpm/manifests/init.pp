class fpm() {

  include fpm::deps
    
  file { '/etc/gemrc':
    ensure => present,
    owner  => root,
    group  => root,
    source => 'puppet:///modules/fpm/gemrc',
  }

}
