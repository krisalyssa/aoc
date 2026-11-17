#!/usr/bin/env bash

# This file contains common utility functions used by the AoC scripts.
# It should be sourced by all main scripts to provide consistent functionality.

# Utility function to run commands with optional verbose output and dry-run support
run_cmd() {
    local cmd="${1}"

    [[ -n "${AOC_VERBOSE}" ]] && echo "running: ${cmd}" 1>&2
    if [[ -z "${AOC_DRY_RUN}" ]]; then
        eval "${cmd}"
    fi
}

# Generate a container name based on year and language
container_name() {
    [[ -n "${AOC_VERBOSE}" ]] && echo "enter: container_name" 1>&2

    local aoc_year="${1}" aoc_lang="${2}"
    local container_name

    container_name="aoc-${aoc_lang}-${aoc_year}"

    [[ -n "${AOC_VERBOSE}" ]] && echo "  retval: ${container_name}" 1>&2

    echo "${container_name}"

    [[ -n "${AOC_VERBOSE}" ]] && echo " exit: container_name" 1>&2
}

# Execute a script inside a running container
container_exec() {
    [[ -n "${AOC_VERBOSE}" ]] && echo "enter: container_exec" 1>&2

    local aoc_script="${1}" aoc_year="${2}" aoc_lang="${3}" aoc_day="${4}" aoc_tag="${5:-latest}"
    local container_name cmd

    container_name=$(container_name "${aoc_year}" "${aoc_lang}")

    if command -v container > /dev/null 2>&1; then
        cmd=$(
            cat << EOF
container exec \
    --env AOC_LANG="${aoc_lang}" \
    --env AOC_TAG="${aoc_tag}" \
    --env AOC_YEAR="${aoc_year}" \
    --interactive \
    --tty \
    ${ADDITIONAL_FLAGS:-} \
    "${container_name}" "bin/${aoc_script}" "${aoc_day}"
EOF
        )
    elif command -v docker > /dev/null 2>&1; then
        cmd=$(
            cat << EOF
docker exec \
    --env AOC_LANG="${aoc_lang}" \
    --env AOC_TAG="${aoc_tag}" \
    --env AOC_YEAR="${aoc_year}" \
    --interactive \
    --tty \
    ${ADDITIONAL_FLAGS:-} \
    "${container_name}" "bin/${aoc_script}" "${aoc_day}"
EOF
        )
    else
        echo "container CLI or docker CLI is required to run this script"
        exit 1
    fi

    run_cmd "${cmd}"

    [[ -n "${AOC_VERBOSE}" ]] && echo " exit: container_exec" 1>&2
}

# Run a script in a new container
container_run() {
    [[ -n "${AOC_VERBOSE}" ]] && echo "enter: container_run" 1>&2

    local aoc_script="${1}" aoc_year="${2}" aoc_lang="${3}" aoc_day="${4}" aoc_tag="${5:-latest}"
    local container_name cmd

    container_name=$(container_name "${aoc_year}" "${aoc_lang}")

    if command -v container > /dev/null 2>&1; then
        cmd=$(
            cat << EOF
container start "${container_name}"
EOF
        )
        run_cmd "${cmd}"

        cmd=$(
            cat << EOF
container exec \
    --env AOC_LANG="${aoc_lang}" \
    --env AOC_TAG="${aoc_tag}" \
    --env AOC_YEAR="${aoc_year}" \
    --interactive \
    --tty \
    ${ADDITIONAL_FLAGS:-} \
    "${container_name}" "bin/${aoc_script}" "${aoc_day}"
EOF
        )
        run_cmd "${cmd}"

    elif command -v docker > /dev/null 2>&1; then
        cmd=$(
            cat << EOF
docker run \
    --env AOC_DAY="${aoc_day}" \
    --env AOC_LANG="${aoc_lang}" \
    --env AOC_TAG="${aoc_tag}" \
    --env AOC_YEAR="${aoc_year}" \
    --interactive \
    --mount "type=bind,src=${AOC_ROOT}/years/${aoc_year}/${aoc_lang},dst=/aoc/src" \
    --mount "type=bind,src=${AOC_ROOT}/years/${aoc_year}/data,dst=/aoc/data" \
    ${ADDITIONAL_MOUNTS:-} \
    --name "${container_name}" \
    --rm \
    --tty \
    ${ADDITIONAL_FLAGS:-} \
    "ghcr.io/krisalyssa/aoc/aoc-${aoc_lang}:${aoc_tag}" \
    -c "bin/${aoc_script} ${aoc_day}"
EOF
        )
        run_cmd "${cmd}"
    else
        echo "container CLI or docker CLI is required to run this script"
        exit 1
    fi

    [[ -n "${AOC_VERBOSE}" ]] && echo " exit: container_run" 1>&2
}

# Get the state of a container (running, stopped, etc.)
container_state() {
    [[ -n "${AOC_VERBOSE}" ]] && echo "enter: container_state" 1>&2

    local aoc_year="${1}" aoc_lang="${2}"
    local name state

    name=$(container_name "${aoc_year}" "${aoc_lang}")

    if command -v container > /dev/null 2>&1; then
        cmd=$(
            cat << EOF
container ls --all --format json | jq -r --arg name "${name}" 'map(select(.id == \$name)) | .[0].status.state'
EOF
        )

        state=$(run_cmd "${cmd}")

    elif command -v docker > /dev/null 2>&1; then
        cmd=$(
            cat << EOF
docker ps --all --format json | jq -r --arg name "${name}" 'map(select(.Names == $name)) | .[0].State'
EOF
        )

        state=$(run_cmd "${cmd}")
    else
        echo "container CLI or docker CLI is required to run this script"
        exit 1
    fi

    [[ -n "${AOC_VERBOSE}" ]] && echo "  retval: ${state}" 1>&2

    echo "${state}"

    [[ -n "${AOC_VERBOSE}" ]] && echo " exit: container_state" 1>&2
}

# Get the current year (for default values)
get_current_year() {
    # for Linux? CURRENT_YEAR=$(date --iso-8601 | cut -d '-' -f 1)
    # shellcheck disable=SC2312
    date -I | cut -d '-' -f 1
}

# Get the current day (for default values)
get_current_day() {
    # for Linux? CURRENT_DAY=$(date --iso-8601 | cut -d '-' -f 3)
    # shellcheck disable=SC2312
    date -I | cut -d '-' -f 3
}

# Parse and validate a year value
validate_year() {
    local year=$1
    local current_year=$(get_current_year)

    if [[ -z "${year}" ]]; then
        echo "Year is required"
        return 1
    fi

    if ((year < 2015 || year > current_year)); then
        echo "Year out of range (must be between 2015 and ${current_year})"
        return 1
    fi

    return 0
}

# Parse and validate a day value
validate_day() {
    local day=$1
    local year=$2
    local current_year=$(get_current_year)
    local current_day=$(get_current_day)

    if [[ -z "${day}" ]]; then
        echo "Day is required"
        return 1
    fi

    # strip leading zero, if any, for proper numeric comparisons
    [[ -n "${day}" ]] && day=$((day + 0))

    if ((day < 1 || day > 25)); then
        echo "Day out of range (must be between 1 and 25)"
        return 1
    elif ((year == current_year && day > current_day)); then
        echo "Day ${day} hasn't been released yet"
        return 1
    fi

    return 0
}

# Get available languages
get_languages() {
    local langs=()
    while IFS= read -r -d '' filename; do
        langs+=("$(basename "$(dirname "${filename}")")")
    done < <(find "${AOC_ROOT}/lang" -type f -name 'Dockerfile' -print0 | sort -z)

    echo "${langs[@]}"
}