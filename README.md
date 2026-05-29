<h1 align=center>Dockette / Expose</h1>

<p align=center>
    Expose local sites via secure tunnels using Expose app written in PHP.
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

<p align=center>
   <a href="https://github.com/dockette/expose/actions"><img src="https://github.com/dockette/expose/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/expose"><img src="https://img.shields.io/docker/pulls/dockette/expose.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
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

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
