define fpm::exec(
  $output,
  $input,
  $package      = $title,
  $dependencies = [],
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

  $search_part = $searchdir ? {
    undef   => '',
    default => "-C ${searchdir}",
  }

  $deps_part = inline_template('<%= dependencies.map{ |dep| "-d #{dep}" }.join(" ") %>')

  # path provides: uname, fpm, and build tools
  exec { "fpm-${title}":
    cwd     => $cwd,
    path    => ['/bin', '/usr/bin', '/usr/local/bin'],
    command => "fpm -t ${output} -s ${input} --name ${package} ${version_part} ${search_part} ${deps_part} ${package_opts} ${args}",
    # creates => "${cwd}/${package}_${version}_${architecture}.deb"
  }

}
