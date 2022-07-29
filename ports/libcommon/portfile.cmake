vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO buracchi/common
    REF 119f2088764d35f3b1bdba74fe2d70775882afa0
    SHA512 e22b08133786d1d3ad3fd2dfaf6bc2e0056d4ef4a17cdd9d06de9476ff75337ced3465cdcbd2af8254b26257939ed18e7b207f143faaf1c580457e30d2d6ee33
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
