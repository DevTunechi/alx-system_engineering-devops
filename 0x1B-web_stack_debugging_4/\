# Nginx configuration Puppet manifest

class nginx_tuning {

  # Ensure Nginx package is installed
  package { 'nginx':
    ensure => present,
  }

  # Ensure the Nginx service is enabled and running
  service { 'nginx':
    ensure     => running,
    enable     => true,
    subscribe  => File['/etc/nginx/nginx.conf'],
  }

  # Configure Nginx main configuration file
  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    content => template('nginx/nginx.conf.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  # Configure additional worker connections
  file { '/etc/nginx/conf.d/worker_connections.conf':
    ensure  => file,
    content => template('nginx/worker_connections.conf.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
}

# Apply the Nginx tuning class
include nginx_tuning
