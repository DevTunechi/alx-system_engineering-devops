# Extension fixer

$fname = 'wp-settings.php'

exec { 'path_extension_fixer':
  command => "sed -i s/phpp/php/g /var/www/html/${fname}",
  path    => '/usr/local/bin/:/bin',
}
