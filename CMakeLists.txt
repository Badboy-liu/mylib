cmake_minimum_required(VERSION 4.1)
project(mylib)

set(CMAKE_CXX_STANDARD 20)

add_library(${PROJECT_NAME} src/mylib.cpp)
target_compile_definitions(${PROJECT_NAME} PRIVATE MYLIB_EXPORTS)
target_include_directories(${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

install(TARGETS ${PROJECT_NAME}
        EXPORT mylibTargets
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin
)

install(DIRECTORY  include/ DESTINATION include)

install(EXPORT mylibTargets
        FILE mylibTargets.cmake
        NAMESPACE mylib::
        DESTINATION share/mylib
)


include(CMakePackageConfigHelpers)

# 生成 Config.cmake
configure_package_config_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/cmake/mylibConfig.cmake.in
        ${CMAKE_CURRENT_BINARY_DIR}/mylibConfig.cmake
        INSTALL_DESTINATION share/mylib
)

# 生成版本文件
write_basic_package_version_file(
        ${CMAKE_CURRENT_BINARY_DIR}/mylibConfigVersion.cmake
        VERSION 1.0.0
        COMPATIBILITY AnyNewerVersion
)

# 安装 Config
install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/mylibConfig.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/mylibConfigVersion.cmake
        DESTINATION share/mylib
)
