# aoc

> An umbrella project for [Advent of Code](https://adventofcode.com) exercises.

## INSTALLATION

## USAGE

    aoc init

### Temporary usage

    lang/${LANG}/run ${YEAR} ${DAY}
    lang/${LANG}/test ${YEAR}

## DESIGN PHILOSOPHY

I like to use AoC each year to learn a new programming language. Unfortunately, this means installing
a new programming language each year, keeping it updated as needed, and remembering to uninstall it
once AoC is complete for the year. Toolchain managers like [asdf](https://asdf-vm.com) take some of
the pain away, but not all of it.

Another thing I'd like to try is using a year's solutions in one language to help learn another.
Depending on how I go about it, I could be downloading and storing multiple copies of the contest
data. I'd like to avoid this if possible.

I decided to see if I could leverage [Docker](https://www.docker.com). Several advantages came to mind:

* Docker containers can mount storage, and this storage can be shared by several containers. I'll need
  to take care to not write to storage from more than one container.
* Docker images for programming languages are commonly available, so working with a new language should
  be as simple as finding an image and creating a container from it.

### Authenticate

Follow these instructions to get your auth token and paste it in the prompt below.

  1) Open <https://adventofcode.com/auth/login> in a web browser.
  2) Open your browser's developer tools (usually F12) and switch to the network tab.
  3) On the Advent of Code login page, click on the link for the auth provider of your choice.
  4) Follow the steps to complete authentication. This should result in a logged-in Advent of Code page.
  5) Switch back to the developer tools and look for a network request starting with "callback?" - click on it.
  6) Under Response headers, find the "set-cookie" header and look for a string starting with "session=".
  7) Paste everything after "session=" until the semicolon into the prompt below.

## ROADMAP

* [ ] `aoc-get` to fetch data
