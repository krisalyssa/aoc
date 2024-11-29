# aoc

> An umbrella project for [Advent of Code](https://adventofcode.com) exercises.

## INSTALLATION

```shell
git clone https://github.com/krisalyssa/aoc.git
```

## USAGE

```shell
aoc build elixir
aoc get
aoc run -y 2023 -d 1 elixir
aoc start -y 2023 elixir
```

## SUBCOMMANDS

### build

Builds an image for a language for local testing.

There are two equivalent forms of the subcommand:

```shell
aoc build -l <language> [ -t <tag> ]
aoc build [ -t <tag> ] <language>
```

- If `-t` is not given, `<tag>` defaults to `local`.

### get

Gets puzzle data from adventofcode.com.

```shell
aoc get [-f] [-n] [-q] [-v] [year [day]]
```

If day is omitted, get data for all days for the year.
If year is omitted, get data for all years since and including 2015.

Options:

- -f -- force download of data even if the file exists locally
- -h -- show help
- -n -- show what will be executed, but don't actually execute it
- -q -- decrease verbosity of output
- -v -- increase verbosity of output

### run

Runs code for a year, day, and language.

- A Docker container for the language (and tag if `-t` is given) is started.
- The data directory for the year is mounted at `/aoc/data` in the container.
- The language's source directory is mounted at `/aoc/src` in the container.
- The language's `run` script is executed and passed the day on the command line.

There are two equivalent forms of the subcommand:

```shell
aoc run -l <language> [ -y <year> ] [ -d <day> ] [ -t <tag> ]
aoc run [ -y <year> ] [ -d <day> ] [ -t <tag> ] <language>
```

- If `-y` is not given, `<year>` defaults to the current year.
- If `-d` is not given, `<day>` defaults to the current day.
- If `-t` is not given, `<tag>` defaults to `latest`.

### start

Starts a Docker container for the language, with data files mounted.

- A Docker container for the language (and tag if `-t` is given) is started.
- The data directory for the year is mounted at `/aoc/data` in the container.
- The language's source directory is mounted at `/aoc/src` in the container.

There are two equivalent forms of the subcommand:

```shell
aoc start -l <language> [ -y <year> ] [ -t <tag> ]
aoc start [ -y <year> ] [ -t <tag> ] <language>
```

- If `-y` is not given, `<year>` defaults to the current year.
- If `-t` is not given, `<tag>` defaults to `latest`.

## ADDING A LANGUAGE

- Create a directory in `lang`.
- Add a `Dockerfile`, basing it on an official image for the language if possible.
- Add language-specific `aoc-*` scripts.
- Add a `bin` directory with container scripts.
- Add a `skeleton` directory with boilerplate files.
- Add a `README.md`.

## DESIGN PHILOSOPHY

I like to use AoC each year to learn a new programming language. Unfortunately, this means installing
a new programming language each year, keeping it updated as needed, and remembering to uninstall it
once AoC is complete for the year. Toolchain managers like [asdf](https://asdf-vm.com) take some of
the pain away, but not all of it.

Another thing I'd like to try is using a year's solutions in one language to help learn another.
Depending on how I go about it, I could be downloading and storing multiple copies of the contest
data. I'd like to avoid this if possible.

I decided to see if I could leverage [Docker](https://www.docker.com). Several advantages came to mind:

- Docker containers can mount storage, and this storage can be shared by several containers. I'll need
  to take care to not write to storage from more than one container.
- Docker images for programming languages are commonly available, so working with a new language should
  be as simple as finding an image and creating a container from it.

### Authenticate

Follow these instructions to get your auth token and paste it in the prompt below.

1. Open <https://adventofcode.com/auth/login> in a web browser.
2. Open your browser's developer tools (usually F12) and switch to the network tab.
3. On the Advent of Code login page, click on the link for the auth provider of your choice.
4. Follow the steps to complete authentication. This should result in a logged-in Advent of Code page.
5. Switch back to the developer tools and look for a network request starting with "callback?" - click on it.
6. Under Response headers, find the "set-cookie" header and look for a string starting with "session=".
7. Paste everything after "session=" until the semicolon into the prompt below.

## ROADMAP

- [ ] `aoc-get` to fetch data
