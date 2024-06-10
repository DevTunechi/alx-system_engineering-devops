# Ensure the 'holberton' user exists and is part of the 'sudo' group
user { 'holberton':
  ensure     => present,
  managehome => true,
  shell      => '/bin/bash',
}

# Ensure the 'sudo' group exists (it's usually already present, but to be safe)
group { 'sudo':
  ensure => present,
}

# Ensure the 'holberton' user is a member of the 'sudo' group
exec { 'add_holberton_to_sudo':
  command => '/usr/sbin/usermod -aG sudo holberton',
  unless  => '/bin/bash -c "id -nG holberton | grep -qw sudo"',
  require => User['holberton'],
}

# Ensure the limits.conf file is configured for the 'holberton' user
file_line { 'holberton_soft_nofile':
  ensure => present,
  path   => '/etc/security/limits.conf',
  line   => 'holberton soft nofile 4096',
}

file_line { 'holberton_hard_nofile':
  ensure => present,
  path   => '/etc/security/limits.conf',
  line   => 'holberton hard nofile 8192',
}

# Ensure the PAM limits module is enabled
file_line { 'pam_limits':
  ensure => present,
  path   => '/etc/pam.d/common-session',
  line   => 'session required pam_limits.so',
}
