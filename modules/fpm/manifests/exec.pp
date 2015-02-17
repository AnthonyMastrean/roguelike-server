define fpm::exec(
  $output,
  $input,
  $package      = $title,
  $package_opts = undef,
  $args         = undef,
  $cwd          = undef,
  $searchdir    = undef,
  $version      = undef,
){

  $version_part = $version ? {
    undef   => '',
    default => "--version ${version}",
  }

  $searchdir_part = $searchdir ? {
    undef   => '',
    default => "-C ${searchdir}",
  }

  # path provides: uname, rpmbuild, fpm
  exec { "fpm-${title}":
    cwd       => $cwd,
    path      => ['/bin', '/usr/bin', '/usr/local/bin'],
    command   => "fpm -t ${output} -s ${input} --name ${package} ${version_part} ${searchdir_part} ${package_opts} ${args}",
  }

}
