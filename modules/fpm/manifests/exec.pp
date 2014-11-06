define fpm::exec(
  $output,
  $source,
  $package = undef,
  $version = undef,
  $architecture = undef,
  $args = [],
){

  include fpm

  $name_part = $package ? {
    undef => "",
    default => " --name ${package}",
  }

  $version_part = $version ? {
    undef => "",
    default => " --version ${version}",
  }

  $architecture_part = $architecture ? {
    undef => "",
    default => " --architecture ${architecture}",
  }

  exec { "":
    path => ["/opt/vagrant_ruby/bin"],
    command => "fpm -t ${output} -s ${source}${name_part}${version_part}${architecture_part}${args}",
    require => Class["fpm"],
  }

}
