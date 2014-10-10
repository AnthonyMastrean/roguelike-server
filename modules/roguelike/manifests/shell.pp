define roguelike::shell(
  $user = $title,
  $password = $title,
  $group = "games",
  $shell = undef,
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
    require => File["/home/${user}"],
  }

}