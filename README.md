<h1 align=center>Dockette / Expose</h1>

<p align=center>
    Expose local sites via secure tunnels using Expose app written in PHP.
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

<p align=center>
    <a href="https://hub.docker.com/r/dockette/expose/"><img src="https://img.shields.io/docker/stars/dockette/expose.svg?style=flat-square"></a>
    <a href="https://hub.docker.com/r/dockette/expose/"><img src="https://img.shields.io/docker/pulls/dockette/expose.svg?style=flat-square"></a>
    <a href="https://bit.ly/ctteg"><img src="https://img.shields.io/gitter/room/contributte/contributte.svg?style=flat-square"></a>
    <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-me-brightgreen?style=flat-square"></a>
</p>

-----

## Usage

### Server

Fastest way:

```
docker run \
    -it \
    --rm \
    -p 80:80 \
    -e EXPOSE_HOST=yourdomain.dev \
    -e EXPOSE_PORT=80 \
    dockette/expose
```

Persistent way:

```
docker run \
    -it \
    --rm \
    -p 80:80 \
    -v $(pwd)/data:/data
    dockette/expose
```

### Client

```
docker run \
    -it \
    --rm \
    --network=host \
    -e EXPOSE_HOST=yourdomain.dev \
    -e EXPOSE_PORT=80 \
    dockette/expose \
    share \
    --subdomain=foo \
    http://0.0.0.0:5000
```

> Use http://host.docker.internal:5000 on OSX.

## Documentation

You can easily setup Expose via environment variables. This is list of default values.

```
- EXPOSE_HOST=localhost         # expose domain
- EXPOSE_PORT=8000              # expose port
- EXPOSE_USERNAME=dockette      # dashboard user name
- EXPOSE_PASSWORD=expose        # dashboard user password
- EXPOSE_TOKEN=                 # expose token
- EXPOSE_ADMIN=admin            # dashboard subdomain
- EXPOSE_DB=/data/expose.db     # expose database (for users)
```

For more details, take a look at Expose's [official documentation](https://expose.beyondco.de/docs/server/starting-the-server).

**How to test it?**

```
# Server
docker run -it --rm -p 8000:8000 -e EXPOSE_HOST=expose.local dockette/expose
```

```
echo "Hello world" >> index.php

# Application
php -S http://0.0.0.0:5000 index.php
```

```
# Tunnel (Unix)
docker run -it --rm --network=host -e EXPOSE_HOST=expose.local dockette/expose share --subdomain=foo http://0.0.0.0:5000
```

> Use http://host.docker.internal:5000 on OSX.

## Development

See [how to contribute](https://contributte.org/contributing.html) to this package.

This package is currently maintaining by these authors.

<a href="https://github.com/f3l1x">
    <img width="80" height="80" src="https://avatars2.githubusercontent.com/u/538058?v=3&s=80">
</a>

-----

Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Also thank you for using this package.
