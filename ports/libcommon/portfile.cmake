vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO buracchi/common
    REF 4d5fb306a6cf683615f25f802ca3e2b0eb1f3c9f
    SHA512 70a7bb620ab10ff4be75b3f634bf5edb511b75fc0ff7db86b497374df6678afd5e6029e8496105419c43827ec2f2bbdb300f23719a5a025de2396d01c1b84d59
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
