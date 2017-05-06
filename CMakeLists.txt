cmake_minimum_required(VERSION 2.8.12)
project(DerelictGL3 D)
list(APPEND CMAKE_MODULE_PATH
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(Derelict REQUIRED
    COMPONENTS
        util)

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/source")
add_library(DerelictGL3 STATIC
    source/derelict/opengl3/arb.d
    source/derelict/opengl3/cgl.d
    source/derelict/opengl3/constants.d
    source/derelict/opengl3/deprecatedConstants.d
    source/derelict/opengl3/deprecatedFunctions.d
    source/derelict/opengl3/ext.d
    source/derelict/opengl3/functions.d
    source/derelict/opengl3/gl.d
    source/derelict/opengl3/gl3.d
    source/derelict/opengl3/glx.d
    source/derelict/opengl3/glxext.d
    source/derelict/opengl3/internal.d
    source/derelict/opengl3/types.d
    source/derelict/opengl3/wgl.d
    source/derelict/opengl3/wglext.d)
target_link_libraries(DerelictGL3
    Derelict::util)

install(
    TARGETS             DerelictGL3
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin)
install(
    DIRECTORY   source/
    DESTINATION include/d)
