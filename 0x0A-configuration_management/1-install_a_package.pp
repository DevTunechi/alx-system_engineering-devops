# Class: my_module::flask_installation

  package { 'flask':
    ensure   => '2.1.0',   # Ensure version 2.1.0 is installed
    provider => 'pip3',    # Use pip3 provider to install Flask
  }

  package { 'werkzeug':
    ensure   => '2.1.1',   # Ensure version 2.1.1 is installed
    provider => 'pip3',    # Use pip3 provider to install Werkzeug
  }
