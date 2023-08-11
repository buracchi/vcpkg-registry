vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO buracchi/cutest
    REF c078f30eaece869f66e85d88ad6b3e86607af4b9
    SHA512 85f64bde6f24ea228677ad2f133c2ae02ec879d43eeb95dceeea2254606ce6b7afa7d5db3c03b40b8f488c8cdfbf14ccf0d0f42170fad83f4d543c24436dfc85
    HEAD_REF master
)

set(CUTEST_BUILD_TESTS OFF)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS ${FEATURE_OPTIONS}
        -DCUTEST_BUILD_TESTS=${CUTEST_BUILD_TESTS}
)

vcpkg_cmake_install()
