# AoC Julia

<https://www.matecdev.com/posts/julia-create-project.html>

## TODO

- generate new project in `aoc init` so `Project.toml` gets a new UUID
- activate project in `aoc init`

## NOTES

We have to use a base image built on Debian instead of Alpine because Julia doesn't seem to support the latter for `linux/arm64`.
We apologize to your Docker image store in advance.
