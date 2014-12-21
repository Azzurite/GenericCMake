function (copy_libs project)
	foreach (_lib ${ARGN})
		add_custom_command(TARGET ${project} POST_BUILD
			COMMAND ${CMAKE_COMMAND} -E copy_if_different
			"${PROJECT_SOURCE_DIR}/lib/${_lib}"
			$<TARGET_FILE_DIR:${project}>)
	endforeach()
endfunction()
