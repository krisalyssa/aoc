# AoC Julia

<https://julialang.org/>
<https://julialang.org/learning/tutorials/>
<https://docs.julialang.org/en/v1/manual/command-line-interface/>
<https://docs.julialang.org/en/v1/manual/getting-started/>
<https://docs.julialang.org/en/v1/stdlib/REPL/>
<https://pkgdocs.julialang.org/v1/>
<https://www.matecdev.com/posts/julia-create-project.html>
<https://techytok.com/lesson-data-structures/>

## TODO

- generate new project in `aoc init` so `Project.toml` gets a new UUID
- activate project in `aoc init`

## NOTES

We have to use a base image built on Debian instead of Alpine because Julia doesn't seem to support the latter for `linux/arm64`.
We apologize to your Docker image store in advance.
