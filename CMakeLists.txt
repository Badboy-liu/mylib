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

