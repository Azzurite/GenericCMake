###########################################################################
## Project build                                                         ##
## -------------                                                         ##
## Should probably not be changed across projects.                       ##
###########################################################################
project(${PROJECT_NAME})

###### Library inclusion #######
include(CMake/add_package.cmake)

foreach (package_ ${THIRD_PARTY_PACKAGES})
	add_package_to_build(${package_})
endforeach()

if (${ADD_BOOST})
	include(CMake/add_package_boost.cmake)
endif()

######################################
##       Assemble executables       ##
######################################
include(CMake/add_source_files.cmake)

###### Main executable ######
if (HAS_LIBS)
	add_subdirectory("lib")
endif()
add_subdirectory("src")

include_directories("src")

if (IS_LIBRARY)
	set(CMAKE_SHARED_LIBRARY_PREFIX "")
	add_library(${PROJECT_NAME} ${SOURCE_FILES})
else()
	add_executable(${PROJECT_NAME} src/Main.cpp ${SOURCE_FILES})
endif()
foreach (LIB_ ${LIBS})
	target_link_libraries(${PROJECT_NAME} ${LIB_})
endforeach()
target_link_libraries(${PROJECT_NAME} ${STATIC_LIBRARIES})

#logging
get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
message(STATUS "src_include_dirs: ${dirs}")
message(STATUS "linked libraries:  ${STATIC_LIBRARIES}")


###### UnitTest executable ######
if (HAS_TESTS)
	add_subdirectory("test")

	set(TEST_PROJECT_NAME ${PROJECT_NAME}_tests)

	add_executable(${TEST_PROJECT_NAME} EXCLUDE_FROM_ALL test/Main.cpp ${SOURCE_FILES} ${TEST_FILES})
	foreach (TEST_LIB_ ${TEST_LIBS})
		target_link_libraries(${TEST_PROJECT_NAME} ${TEST_LIB_})
	endforeach()
	target_link_libraries(${TEST_PROJECT_NAME} ${STATIC_LIBRARIES})
endif()

###### Copy necessary files ######
include(CMake/copy_lib.cmake)
include(CMake/copy_resources.cmake)

###### Main executable ######
if (NOT IS_LIBRARY)
	copy_libs(${PROJECT_NAME} ${DYNAMIC_LIBRARIES})
	copy_resources(${PROJECT_NAME})
endif()


###### UnitTest executable ######
if (HAS_TESTS)
	copy_libs(${TEST_PROJECT_NAME} ${DYNAMIC_LIBRARIES})
endif()


######################################
##           Installation           ##
######################################
if (IS_LIBRARY)
	install(
		DIRECTORY src/
		DESTINATION ${INSTALL_DIRECTORY_HEADERS}/${PROJECT_NAME}
		FILES_MATCHING PATTERN "*.h"
	)
	install(
		TARGETS ${PROJECT_NAME}
		ARCHIVE DESTINATION ${INSTALL_DIRECTORY}
		RUNTIME DESTINATION ${INSTALL_DIRECTORY_SHARED}
	)
else()
	install(
		TARGETS ${PROJECT_NAME}
		DESTINATION ${INSTALL_DIRECTORY}
	)
endif()
