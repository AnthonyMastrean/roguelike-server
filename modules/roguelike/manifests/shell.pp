define roguelike::shell(
  $user = $title,
  $password = sha1("Roguelik3"),
  $group = "games",
  $game = undef,
  $args = undef,
) {

  $home = "/home/${user}"
  $hush = "/home/${user}/.hushlogin"
  $shim = "/home/${user}/.shell"

  $shell = $args ? {
    undef => $game,
    default => $shim,
  }

  File {
    owner => $user,
    group => $group,
  }

  if $args {
    file { $shim:
      mode => "u+x",
      content => "${game} ${args}",
      require => File[$home],
    }
  }

  user { $user:
    gid => $group,
    password => $password,
    managehome => true,
    home => $home,
    shell => $shell,
    require => Group[$group],
  }

  file { $home:
    ensure => directory,
    require => User[$user],
  }

  file { $hush:
    ensure => present,
    require => File[$home],
  }

}
