vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Badboy-liu/mylib
#        REF v1.0.0
        REF master
        SHA512  32c5d3000bddf8df2862a77dffc7b49de99d345f5087257d7939def722a80dc73dcfa779f05791fb5611549b9bd8626a42a49bec8bf2ffc134653b4db0609c4f
)


vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
)
vcpkg_install_cmake()

# 🔥 关键：修复 debug/release targets
vcpkg_fixup_cmake_targets(
        CONFIG_PATH share/mylib
)





file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)