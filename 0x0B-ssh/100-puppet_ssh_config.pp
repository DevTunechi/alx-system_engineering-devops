file { '/home/your_username/.ssh':
  ensure => directory,
  owner  => 'your_username',
  group  => 'your_group',
  mode   => '0700',
}

file { '/home/your_username/.ssh/config':
  ensure  => file,
  owner   => 'your_username',
  group   => 'your_group',
  mode    => '0600',
  content => "\
Host your_server_ip_or_domain
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
",
}
