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

[Expose](https://expose.beyondco.de) shares local sites through secure tunnels. It is a PHP app by Beyond Code. This
image runs the Expose server and client, set up through environment variables.

## Features

- Expose `1.5.1` on PHP 8.0 (Debian bookworm)
- Server and client in one image: without arguments it runs `expose serve`, arguments (such as `share`) go to `expose`
- Dashboard on the `admin` subdomain, users stored in `/data/expose.db`
- Settings through `EXPOSE_*` environment variables

## Usage

```sh
docker run -it --rm -p 80:80 -e EXPOSE_HOST=yourdomain.dev -e EXPOSE_PORT=80 dockette/expose
```

```sh
# Server, with the database kept in ./data
docker run -it --rm -p 80:80 -v $(pwd)/data:/data dockette/expose

# Client: share a local site as foo.yourdomain.dev (use http://host.docker.internal:5000 on OSX)
docker run -it --rm --network=host -e EXPOSE_HOST=yourdomain.dev -e EXPOSE_PORT=80 \
    dockette/expose share --subdomain=foo http://0.0.0.0:5000

# Try it locally: server, a demo app and a tunnel to it
docker run -it --rm -p 8000:8000 -e EXPOSE_HOST=expose.local dockette/expose
echo "Hello world" >> index.php
php -S http://0.0.0.0:5000 index.php
docker run -it --rm --network=host -e EXPOSE_HOST=expose.local dockette/expose share --subdomain=foo http://0.0.0.0:5000
```

## Configuration

| Variable          | Default            | Meaning                       |
|-------------------|--------------------|-------------------------------|
| `EXPOSE_HOST`     | `localhost`        | expose domain                 |
| `EXPOSE_PORT`     | `8000`             | expose port                   |
| `EXPOSE_USERNAME` | `dockette`         | dashboard user name           |
| `EXPOSE_PASSWORD` | `expose`           | dashboard user password       |
| `EXPOSE_TOKEN`    |                    | expose token                  |
| `EXPOSE_ADMIN`    | `admin`            | dashboard subdomain           |
| `EXPOSE_DB`       | `/data/expose.db`  | expose database (for users)   |

For more details, see the Expose [documentation](https://expose.beyondco.de/docs/server/starting-the-server).

## Versions

| Version | Release |
|---------|---------|
| `dockette/expose:YYYY.MM.DD` | release `YYYY.MM.DD` |
| `dockette/expose:latest` | latest build of `master` |

Releases are listed on [GitHub](https://github.com/dockette/expose/releases).

## Development

```sh
make docker-build   # build the image
make docker-push    # push the image
make test-expose    # run the server on port 8000
make test-server    # open a shell in the image
make version        # print VERSION
make release        # set today's date in VERSION
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to
[support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
