define fpm::exec(
  $output,
  $input,
  $package   = $title,
  $args      = [],
  $cwd       = undef,
  $searchdir = undef,
  $version   = undef,
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
  exec { "fpm-${package}":
    cwd       => $cwd,
    path      => ['/bin', '/usr/bin', '/usr/local/bin'],
    command   => "fpm -t ${output} -s ${input} --name ${package} ${version_part} ${searchdir_part} ${args}",
    logoutput => on_failure,
  }

}
