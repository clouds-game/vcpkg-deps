set(EIGEN3_GIT_COMMIT "68f4e58cfacc686583d16cff90361f0b43bc2c1b")

vcpkg_from_gitlab(
    GITLAB_URL https://gitlab.com
    OUT_SOURCE_PATH SOURCE_PATH
    REPO libeigen/eigen
    REF "${EIGEN3_GIT_COMMIT}"
    SHA512 5b1c1bc02b78128c3b83316a38e1cbc413b16be8ea59e7fc4f3faaf433f9b00d2c0e3abfb36aed24c48c5eddf184fb3ad5c29f615243dd9ab0ce6e0408b8d23a
    HEAD_REF master
)

if(VCPKG_TARGET_IS_ANDROID OR VCPKG_TARGET_IS_IOS)
    list(APPEND PLATFORM_OPTIONS -DCMAKE_Fortran_COMPILER=OFF)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
        -DEIGEN_BUILD_DOC=OFF
        -DEIGEN_BUILD_PKGCONFIG=ON
        ${PLATFORM_OPTIONS}
    OPTIONS_RELEASE
        -DCMAKEPACKAGE_INSTALL_DIR=${CURRENT_PACKAGES_DIR}/lib/cmake/${PORT}
        -DPKGCONFIG_INSTALL_DIR=${CURRENT_PACKAGES_DIR}/lib/pkgconfig
    OPTIONS_DEBUG
        -DCMAKEPACKAGE_INSTALL_DIR=${CURRENT_PACKAGES_DIR}/debug/lib/cmake/${PORT}
        -DPKGCONFIG_INSTALL_DIR=${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT} PACKAGE_NAME Eigen3)
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

file(INSTALL "${SOURCE_PATH}/COPYING.README" DESTINATION "${CURRENT_PACKAGES_DIR}/share")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING.README")
