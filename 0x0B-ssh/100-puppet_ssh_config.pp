file { '/home/your_username/.ssh':
  ensure => directory,
  owner  => 'root',
  group  => 'root',
  mode   => '0700',
}

file { '/home/your_username/.ssh/config':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0600',
  content => "\
Host 34.232.55.92 
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
",
}
