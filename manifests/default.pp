Exec { 
	path => ["/bin", "/usr/bin"],
}

exec { "apt-get update":
}

# http://www.webupd8.org/2010/01/how-to-create-deb-package-ubuntu-debian.html
package { [
  "build-essential", 
  "autoconf", 
  "automake", 
  "autotools-dev", 
  "dh-make", 
  "debhelper", 
  "devscripts", 
  "fakeroot", 
  "xutils", 
  "lintian", 
  "pbuilder"]:
  require => Exec["apt-get update"],
}
