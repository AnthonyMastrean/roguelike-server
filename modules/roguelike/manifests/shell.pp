define roguelike::shell(
  $user = $title,
  $shell = undef,
) {

  user { $user:
    gid => "games",
    password => sha1($user),
    managehome => true,
    home => "/home/${user}",
    shell => $shell,
    require => Group["games"],
  }

  file { "/home/${user}":
    ensure => directory,
    owner => $user,
    group => "games",
    require => User[$user],
  }

  file { "/home/${user}/.hushlogin":
    ensure => present,
    owner => $user,
    group => "games",
    require => File["/home/${user}"],
  }

}
