function (add_package_to_build package)
	if (${ARGC} GREATER 0)
		find_package(${package} REQUIRED COMPONENTS ${ARGN})
	else()
		find_package(${package} REQUIRED)
	endif()

	if (NOT ${package}_FOUND)
		message(SEND_ERROR "${package} not found! Adjust or provide a Find${package}.cmake!")
		return()
	endif (NOT ${package}_FOUND)

	set(STATIC_LIBRARIES ${STATIC_LIBRARIES} ${${package}_LIBRARIES} PARENT_SCOPE)

	include_directories(${${package}_INCLUDE_DIRS})
endfunction()
