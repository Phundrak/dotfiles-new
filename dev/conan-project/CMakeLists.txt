cmake_minimum_required(VERSION 3.14)

project("PROJECTNAME"
        VERSION 0.1
        DESCRIPTION "Description of PROJECTNAME"
        HOMEPAGE_URL "https://labs.phundrak.fr/phundrak/"
        LANGUAGES CXX)

file(GLOB SRC_FILES "src/*.cc")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

include(functions)
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

enable_cxx_compiler_flag_if_supported("-Wall")
enable_cxx_compiler_flag_if_supported("-pedantic")
enable_cxx_compiler_flag_if_supported("-O3")
enable_cxx_compiler_flag_if_supported("-flto")

# include_directories(<PUBLIC HEADER DIRECTORIES>)
set(TGT PROJECTNAME)
add_executable(${TGT} ${SRC_FILES})
target_compile_features(${TGT} PRIVATE cxx_std_17)
target_include_directories(${TGT} PRIVATE include/PROJECTNAME)

# OS specific instructions.
if(APPLE)
elseif(WIN32)
    # Windows developer environment specific instructions.
    if(MINGW)
    elseif(MSYS)
    elseif(CYGWIN)
    endif()
elseif(UNIX)
else()
endif()
