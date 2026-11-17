#!/usr/bin/env bash

run_cmd() {
    local cmd="${1}"

    [[ -n "${AOC_VERBOSE}" ]] && echo "running: ${cmd}" 1>&2
    if [[ -z "${AOC_DRY_RUN}" ]]; then
        eval "${cmd}"
    fi
}

container_name() {
    [[ -n "${AOC_VERBOSE}" ]] && echo "enter: container_name" 1>&2

    local aoc_year="${1}" aoc_lang="${2}"
    local container_name

    container_name="aoc-${aoc_lang}-${aoc_year}"

    [[ -n "${AOC_VERBOSE}" ]] && echo "  retval: ${container_name}" 1>&2

    echo "${container_name}"

    [[ -n "${AOC_VERBOSE}" ]] && echo " exit: container_name" 1>&2
}

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
        echo "container CLI or docker docker CLI is required to run this script"
        exit 1
    fi

    run_cmd "${cmd}"

    [[ -n "${AOC_VERBOSE}" ]] && echo " exit: container_exec" 1>&2
}

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
        echo "container CLI or docker docker CLI is required to run this script"
        exit 1
    fi

    [[ -n "${AOC_VERBOSE}" ]] && echo " exit: container_run" 1>&2
}

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
        echo "container CLI or docker docker CLI is required to run this script"
        exit 1
    fi

    [[ -n "${AOC_VERBOSE}" ]] && echo "  retval: ${state}" 1>&2

    echo "${state}"

    [[ -n "${AOC_VERBOSE}" ]] && echo " exit: container_state" 1>&2
}
