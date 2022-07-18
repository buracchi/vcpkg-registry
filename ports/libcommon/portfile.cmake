vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO buracchi/common
    REF a7daaa2d90c1df4d23d536c40f66dc7e95874193
    SHA512 3d5053be0e52d4b04c10752f825c68c63996632be8238db7e32a62852c1db74cfff745cfe81eabb8aea865b1bc4f20f9972806a7f1521b84e37db6b5c809ef6c
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
