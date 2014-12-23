##########################################################
## Sample user_settings.cmake                           ##
## --------------------------                           ##
## This file can be used to define additional variables ##
## only used for specific system configurations         ##
##########################################################

# this variable defines where the main executable or static library (if IS_LIBRARY equals true) will be put
set(INSTALL_DIRECTORY "/DESIRED/INSTALL/PATH")

# when IS_LIBRARY is true, the headers for the library will be installed here
set(INSTALL_DIRECTORY_HEADERS "/DESIRED/HEADER/PATH")
# shared libraries will be installed here
set(INSTALL_DIRECTORY_SHARED "/DESIRED/SHARED/PATH")

###### search for boost in another directory ######
# set (Boost_LIBRARY_DIR "P:/lib/x64/")

###### Compiler flags ######
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -Wall -pedantic -Wextra")
#set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Og -ggdb -DDEBUG")
