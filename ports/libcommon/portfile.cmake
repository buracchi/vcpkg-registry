vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO buracchi/common
    REF d345174a12ec147ae809db4309ca7e695adc51f1
    SHA512 4c5abd5d1e45d5eae24d8d000badbc70227bab01bbd8e2f0bb117778e774299950eec5c60faf8613a9000b33adc909b797dada8936c6e37867c5e1846b790f29
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
