define roguelike(
  $user = $title,
  $password = $user,
  $group = "games",
  $shell = $undef,
) {

  user { $user:
    gid => $group,
    password => sha1($password),
    managehome => true,
    home => "/home/${user}",
    shell => $shell,
    require => Group[$group],
  }

  file { "/home/${user}":
    ensure => directory,
    owner => $user,
    group => $group,
    require => User[$user],
  }

  file { "/home/${user}/.hushlogin":
    ensure => present,
    owner => $user,
    group => $group,
    require => File["/home/${user}"],
  }

}
