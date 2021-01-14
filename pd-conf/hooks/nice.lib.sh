#!/usr/bin/env sh
print_status ()
{
    _msg="Error"
    _code="1"
    if test "${1}" -eq 0
    then
        _msg="OK"
        _code="2"
    else
        if test -n "${2}" && test "${1}" -eq "${2}"
        then
            _msg="Warning"
            _code="3"
        fi
    fi
    printf '[\033[0;3%sm%s\033[0m]\n' "${_code}" "${_msg}"
    # shellcheck disable=SC2086
    return ${1}
}