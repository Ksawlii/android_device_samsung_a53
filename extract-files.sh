#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib64/hw/android.hardware.gnss@2.1-impl.so|vendor/lib64/hw/vendor.samsung.hardware.gnss@2.0-impl.so)
            "${PATCHELF}" --remove-needed libhidltransport.so "${2}"
            ;;
        vendor/lib64/libexynoscamera3.so)
            "${PATCHELF}" --add-needed libshim_camera.so "${2}"
            ;;
        vendor/lib*/libsec-ril.so)
            xxd -p -c0 "${2}" | sed "s/800e40f9e10316aa820c8052e30315aa/800e40f9e10316aa820c8052080080d2/g" | xxd -r -p > "${2}".patched
            mv "${2}".patched "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=a53x
export DEVICE_COMMON=a53x-common
export VENDOR=samsung

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
