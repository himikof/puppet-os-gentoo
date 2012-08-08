# Class gentoo::etc::portage::backup
#
#  Stores user settings in the /etc/portage/package.* files.
#  
# @author Gunnar Wrobel <p@rdus.de>
# @version 1.0
# @package os_gentoo
#
class gentoo::etc::portage::backup
{
  if $use_isfile != 'false' {
    $use = file('/etc/portage/package.use')
  } else {
    $use = false
  }
  if $keywords_isfile != 'false' {
    $keywords = file('/etc/portage/package.keywords')
  } else {
    $keywords = false
  }
  if $mask_isfile != 'false' {
    $mask = file('/etc/portage/package.mask')
  } else {
    $mask = false
  }
  if $unmask_isfile != 'false' {
    $unmask = file('/etc/portage/package.unmask')
  } else {
    $unmask = false
  }
  if $license_isfile != 'false' {
    $license = file('/etc/portage/package.license')
  } else {
    $license = false
  }
}

# Class gentoo::etc::portage::restore
#
#  Restores user settings from the /etc/portage/package.* files.
#  
# @author Gunnar Wrobel <p@rdus.de>
# @version 1.0
# @package os_gentoo
#
class gentoo::etc::portage::restore
{
  if $gentoo::etc::portage::backup::use {
    file { '/etc/portage/package.use/package.use.original':
      content => $gentoo::etc::portage::backup::use,
      tag     => 'buildhost'
    }
  }
  if $gentoo::etc::portage::backup::keywords {
    file { '/etc/portage/package.accept_keywords/package.keywords.original':
      content => $gentoo::etc::portage::backup::keywords,
      tag     => 'buildhost'
    }
  }
  if $gentoo::etc::portage::backup::mask {
    file { '/etc/portage/package.mask/package.mask.original':
      content => $gentoo::etc::portage::backup::mask,
      tag     => 'buildhost'
    }
  }
  if $gentoo::etc::portage::backup::unmask {
    file { '/etc/portage/package.unmask/package.unmask.original':
      content => $gentoo::etc::portage::backup::unmask,
      tag     => 'buildhost'
    }
  }
  if $gentoo::etc::portage::backup::license {
    file { '/etc/portage/package.accept_license/package.license.original':
      content => $gentoo::etc::portage::backup::license,
      tag     => 'buildhost'
    }
  }
}

# Class gentoo::etc::portage 
#
#  Ensure that all /etc/portage/package.* locations are actually
#  handled as directories. This allows to easily manage the package
#  specific settings for Gentoo.
#  
# @author Gunnar Wrobel <p@rdus.de>
# @version 1.0
# @package os_gentoo
#
class gentoo::etc::portage
{
  # Check that we are able to handle /etc/portage/package.* as 
  # directories

  file { 'package.use::directory':
    path   => '/etc/portage/package.use',
    ensure => 'directory',
    tag    => 'buildhost'
  }

  file { 'package.accept_keywords::directory':
    path   => '/etc/portage/package.accept_keywords',
    ensure => 'directory',
    tag    => 'buildhost'
  }

  file { 'package.mask::directory':
    path   => '/etc/portage/package.mask',
    ensure => 'directory',
    tag    => 'buildhost'
  }

  file { 'package.unmask::directory':
    path   => '/etc/portage/package.unmask',
    ensure => 'directory',
    tag    => 'buildhost'
  }

  file { 'package.accept_license::directory':
    path   => '/etc/portage/package.accept_license',
    ensure => 'directory',
    tag    => 'buildhost'
  }
}


