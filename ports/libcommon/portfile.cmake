vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO buracchi/common
    REF 5974b26d6afd7eb23a9bcc3d1fe281e1b2eb7388
    SHA512 1ee1059e0d96c58b5444e9e4fbe579f0dc78c15d44a036f9d93f51d0f342f4368d8aa478cce40bfe8d8c5ee5a5208b2cf8ba9f7e2f22e826db1a15c21c78bf9d
    HEAD_REF master
)

set(LIBCOMMON_BUILD_TESTS OFF)

#vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
#  FEATURES
#    argparser      LIBCOMMON_ENABLE_ARGPARSER
#    concurrency    LIBCOMMON_ENABLE_CONCURRENCY
#    networking     LIBCOMMON_ENABLE_NETWORKING
#  INVERTED_FEATURES
#)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS ${FEATURE_OPTIONS}
        -DLIBCOMMON_BUILD_TESTS=${LIBCOMMON_BUILD_TESTS}
)

vcpkg_cmake_install()
#vcpkg_cmake_config_fixup()
#
#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
#
#file(
#    INSTALL "${SOURCE_PATH}/LICENSE"
#    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
#    RENAME copyright)
