cmake_minimum_required(VERSION 2.8.12.1)

set(GENERIC_CMAKE_SUBDIRECTORY "CMake")

###########################################################################
## Project Settings                                                      ##
## ----------------                                                      ##
## Can be changed across projects                                        ##
###########################################################################
# how the project and the build targets will be called
set(PROJECT_NAME "")

# when false, this will add "src/Main.cpp" to the build and build an executable.
# otherwise, it will build a library
set(IS_LIBRARY false)
# set the type of the library, either STATIC or SHARED
set(LIBRARY_TYPE STATIC)

# will add the "test" subdirectory and "test/Main.cpp"
set(HAS_TESTS false)

# will add the lib/ directory to the build if true
set(HAS_LIBS false)
# define the names of the built libs to be added to the main target
list(APPEND LIBS )
# define the names of the built libs to be added to the test target
list(APPEND TEST_LIBS )

# will copy the resources/ folder to the installation directory
set(HAS_RESOURCES false)

# third party libs that will be added with find_package
list(APPEND THIRD_PARTY_PACKAGES )

# dynamic libraries that will be copied from the lib/ folder to the app directory
list(APPEND DYNAMIC_LIBRARIES )

# boost libraries
set(ADD_BOOST false)
list(APPEND BOOST_COMPONENTS )

# Settings necessary for individual computer configurations go in this file
include(${GENERIC_CMAKE_SUBDIRECTORY}/user_settings.cmake)

### Build ###
include(${GENERIC_CMAKE_SUBDIRECTORY}/project_build.cmake)
