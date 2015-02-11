define fpm::exec(
  $output,
  $source,
  $cwd          = undef,
  $searchdir    = undef,
  $package      = undef,
  $version      = undef,
  $architecture = undef,
  $args         = [],
){

  $nonce = "${package}-${version}"

  $name_part = $package ? {
    undef   => "",
    default => " --name ${package}",
  }

  $version_part = $version ? {
    undef   => "",
    default => " --version ${version}",
  }

  $architecture_part = $architecture ? {
    undef   => "",
    default => " --architecture ${architecture}",
  }

  $searchdir_part = $searchdir ? {
    undef   => "",
    default => " -C ${searchdir}",
  }

  exec { "fpm ${nonce}":
    path    => ["/usr/bin", "/opt/vagrant_ruby/bin"],
    cwd     => $cwd,
    command => "fpm --force -t ${output} -s ${source}${name_part}${version_part}${architecture_part}${searchdir_part}${args}",
    require => Class["fpm"],
  }

}
