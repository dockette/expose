# AGENTS.md

## Project

Dockette Expose builds `dockette/expose`, a Dockerized Beyond Code Expose server/client for sharing local sites through secure tunnels. The image installs PHP 8.0, Composer, Expose `1.5.1`, custom PHP config, and the repository entrypoint.

## Image

- Default image: `dockette/expose:latest`.
- Build context: repository root `.` with `Dockerfile`, `entrypoint.sh`, `config.php`, and `php.ini`.
- Base image: `dockette/debian:buster`.
- `make build` uses Docker Buildx and `${DOCKER_PLATFORMS:-linux/amd64,linux/arm64}`.
- Runtime defaults are set by `EXPOSE_HOST`, `EXPOSE_PORT`, `EXPOSE_USER`, `EXPOSE_PASSWORD`, `EXPOSE_TOKEN`, `EXPOSE_ADMIN`, and `EXPOSE_DB`.
- GitHub Actions builds a local test image, runs `make test`, then publishes `latest` through the shared Dockette Docker workflow on `master` and the weekly schedule.

## Commands

- `make build` builds `${DOCKER_IMAGE}:${DOCKER_TAG}` with Buildx.
- `make docker-build` performs a local `docker build --pull` without Buildx.
- `make test` runs `expose --version` in the image.
- `make run` starts the server on `8000:8000`.
- `make example-install`, `make example-app`, and `make example-share` support the local PHP example.

## Testing Notes

- Use `make docker-build test` for a local single-platform validation before runtime testing.
- Use `make -n build test run` to dry-run command wiring without requiring Docker.
- Full server/client testing needs Docker networking, a reachable `EXPOSE_HOST`, and an available mapped port.

## Guidelines

- Keep `Dockerfile`, `entrypoint.sh`, `config.php`, `php.ini`, README environment documentation, and `.github/workflows/docker.yml` aligned.
- Prefer `DOCKER_*` names for Docker-related Makefile variables.
- Place `.PHONY: <target>` directly above each Makefile target.
- Keep README badges and maintenance sections consistent with other Dockette image repos.
- Preserve documented environment variable defaults unless the README and tests are updated in the same change.
- Do not introduce unrelated formatting or structural changes.
