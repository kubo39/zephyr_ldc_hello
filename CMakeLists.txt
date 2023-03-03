# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.20.0)
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(ldc_hello)

target_sources(app PRIVATE src/main.c)

include(ExternalProject)
set(ldc_src_dir ${CMAKE_CURRENT_SOURCE_DIR})
ExternalProject_Add(
    ldc_project
    PREFIX  ${CMAKE_CURRENT_BINARY_DIR}
    SOURCE_DIR  ${ldc_src_dir}
    BUILD_IN_SOURCE 1
    BUILD_ALWAYS    1
    CONFIGURE_COMMAND   ""
    BUILD_COMMAND make
    INSTALL_COMMAND ""
    BUILD_BYPRODUCTS    ${ldc_src_dir}/lib/libhello.a
)

add_library(ldc_lib STATIC IMPORTED GLOBAL)
add_dependencies(
    ldc_lib
    ldc_project
)
set_target_properties(ldc_lib PROPERTIES IMPORTED_LOCATION ${ldc_src_dir}/lib/libhello.a)

target_link_libraries(app PUBLIC ldc_lib)
