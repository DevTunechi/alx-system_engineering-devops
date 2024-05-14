file { '/home/root/.ssh':
  ensure => directory,
  owner  => 'root',
  group  => 'root',
  mode   => '0700',
}

file { '/home/root/.ssh/config':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0600',
  content => "\
Host 54.210.122.29 
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
",
}
