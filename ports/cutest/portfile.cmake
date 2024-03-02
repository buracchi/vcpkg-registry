vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO buracchi/cutest
    REF 424fb61ef46ccc405774a9505a8e2381613720e6
    SHA512 979d5be0dd4605dfbefb9523515e8949145ca3cd7343cd4db8ae2075e0997b5e98a2d51cc8a11fa07edbde3ca7b92efb3e4e859c456b6b58c4653abc191655d4
    HEAD_REF main
)

set(CUTEST_BUILD_TESTS OFF)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS ${FEATURE_OPTIONS}
        -DCUTEST_BUILD_TESTS=${CUTEST_BUILD_TESTS}
)

vcpkg_cmake_install()
