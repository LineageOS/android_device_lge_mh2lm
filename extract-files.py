#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)
from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
)

namespace_imports = [
    "device/lge/mh2lm",
    "vendor/lge/sm8150-common",
    "vendor/qcom/opensource/display",
]

blob_fixups: blob_fixups_user_type = {
    'vendor/lib64/hw/fingerprint.msmnile.so': blob_fixup()
        .add_needed('libRbsFlow_shim.so'),
    (
        'vendor/lib64/liblgdnnsnpe.so',
        'vendor/lib64/liblgsnpeawb.so')
    : blob_fixup()
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'mh2lm',
    'lge',
    namespace_imports=namespace_imports,
    lib_fixups=lib_fixups,
    blob_fixups=blob_fixups
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'sm8150-common', module.vendor)
    utils.run()
