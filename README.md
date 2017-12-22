# docker-varnishcache
A docker container running varnishcache.

# Usage

Run the container:
``` bash
docker run -d -p 80:80 -v $(pwd):/data nicoschreiner/varnishcache:latest
```
