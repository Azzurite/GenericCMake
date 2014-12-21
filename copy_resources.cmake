function (copy_resources project)
	add_custom_command(TARGET ${project} POST_BUILD
		COMMAND ${CMAKE_COMMAND} -E copy_directory
		${CMAKE_SOURCE_DIR}/resources
		$<TARGET_FILE_DIR:${project}>/resources)
endfunction()
