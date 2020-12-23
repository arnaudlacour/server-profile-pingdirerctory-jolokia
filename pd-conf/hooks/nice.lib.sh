#!/usr/bin/env sh
print_status ()
{
    if test ${1} -eq 0
    then
        printf '[\033[0;32m%s\033[0m]\n' "OK"
    else
        printf '[\033[0;31m%s\033[0m]\n' "Error"
    fi
    # shellcheck disable=SC2086
    return ${1}
}