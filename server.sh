#!/bin/sh
if ! [ -x "$(command -v php)" ]; then
  if ! [ -x "$(command -v ruby)"]; then
    if ! [ -x "$(command -v python)" ]; then
      echo 'Error: Either python or php or ruby needs to be installed.' >&2
      exit 1
    fi
    # python is a good fallback as it is preinstalled on 
    # common linux distributions
    python -m SimpleHTTPServer
    exit 0
  fi
  ruby -run -e httpd -- -p 8000
  exit 0
fi
# use the built-in php server if available 
# it has some nicer output than the built-in python one.
php -S localhost:8000
