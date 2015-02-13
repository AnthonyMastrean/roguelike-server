class roguelike-adom() {

  include roguelike

  package { 'adom':
    ensure  => '1.2.0_pre23',
    source  => '/vagrant/packages/adom-1.2.0_pre23-1.i386.rpm',
    require => Class['roguelike'],
  }

}
