#!/bin/bash

if [ ! -f /data/default.vcl ]
then
   cp /etc/varnish/default.vcl /data
   chown -R varnish:varnish /data
fi

varnishd -f /data/default.vcl -s malloc,256M -a 0.0.0.0:80
exec varnishlog
