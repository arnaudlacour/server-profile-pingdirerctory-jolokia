#!/usr/bin/env sh
# shellcheck disable=SC1090
. "${HOOKS_DIR}"/pingcommon.lib.sh
. "${HOOKS_DIR}"/nice.lib.sh

_manageExtension="${SERVER_ROOT_DIR}"/bin/manage-extension

printf "Processing extensions.\n"
for _extension in "${STAGING_DIR}"/extensions/*.zip
do
    printf "  - %s" "${_extension}"
    printf "Installing extension [%s] ... " "${_extension}"
    ${_manageExtension} --install "${_extension}" --no-prompt
    _rc=${?}
    print_status ${_rc}
    test ${_rc} -ne 0 && exit 20
done
printf "All extensions processed.\n"
exit 0