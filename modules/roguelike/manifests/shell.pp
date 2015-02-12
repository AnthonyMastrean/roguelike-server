define roguelike::shell(
  $user     = $title,
  $group    = 'games',
  $password = undef,
  $game     = undef,
  $args     = undef,
) {

  $home = "/home/${user}"
  $hush = "/home/${user}/.hushlogin"
  $shim = "/home/${user}/.shell"

  $shell = $args ? {
    undef   => $game,
    default => $shim,
  }

  user { $user:
    gid        => $group,
    password   => $password,
    managehome => true,
    home       => $home,
    shell      => $shell,
  }

  file { $home:
    ensure  => directory,
    owner   => $user,
    group   => $group,
    require => User[$user],
  }

  file { $hush:
    ensure  => present,
    owner   => $user,
    group   => $group,
    require => File[$home],
  }

  if $args {
    file { $shim:
      mode    => 'u+x',
      owner   => $user,
      group   => $group,
      content => "#!/bin/sh\n\n${game} ${args}\n",
      require => File[$home],
    }
  }

}
