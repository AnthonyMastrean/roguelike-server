define fpm::exec(
  $output,
  $input,
  $cwd          = undef,
  $searchdir    = undef,
  $package      = undef,
  $version      = undef,
  $architecture = undef,
  $args         = [],
){

  $nonce = $architecture ? {
    undef   => "${package}-${version}",
    default => "${package}-${version}-${architecture}",
  }

  $name_part = $package ? {
    undef   => '',
    default => " --name ${package}",
  }

  $version_part = $version ? {
    undef   => '',
    default => " --version ${version}",
  }

  $architecture_part = $architecture ? {
    undef   => '',
    default => " --architecture ${architecture}",
  }

  $searchdir_part = $searchdir ? {
    undef   => '',
    default => " -C ${searchdir}",
  }

  exec { "fpm ${nonce}":
    cwd     => $cwd,
    path    => ['/usr/bin', '/usr/local/bin'],
    command => "fpm -t ${output} -s ${input}${name_part}${version_part}${architecture_part}${searchdir_part}${args}",
  }

}
