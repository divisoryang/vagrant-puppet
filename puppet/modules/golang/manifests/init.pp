# == Class: golang
#
# Module to install an up-to-date version of Go from the
# unofficial golang-backports PPA. The use of the PPA means
# this only works on Ubuntu.
#
# === Parameters
# 
# There are no parameters to pass to the module at the moment, as the PPA
# has not established a clear versioning scheme yet.
# 

class golang(
  $version = 'present',
  $package_name = 'golang',
) {
  include apt
  validate_re($package_name, '^golang$')
  validate_string($version)
  validate_re($::osfamily, '^Debian$', 'This module uses PPA repos and only works with Debian based distros')

  apt::ppa { 'ppa:james-page/golang-backports':
    before => Package["new-golang"],
  }

  package { 'new-golang':
    ensure  => $version,
    name    => $package_name,
    require => Apt::Ppa['ppa:james-page/golang-backports'],
  }
}
