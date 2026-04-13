cmake_minimum_required(VERSION 4.1)
project(mylib)

set(CMAKE_CXX_STANDARD 20)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

install(
        TARGETS ${PROJECT_NAME}
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin
)

install(DESTINATION include/ DESTINATION include)

install(
        EXPORT mylibTargets
        FILE mylibTargets.cmake
        NAMESPACE mylib::
        DESTINATION share/mylib
)

