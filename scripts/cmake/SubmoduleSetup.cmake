# This file initializes the required submodules

SET(REQUIRED_SUBMODULES
	Tests/quickcheck
)

FOREACH(SUBMODULE ${REQUIRED_SUBMODULES})
	# Check if submodule is already initialized
	# MESSAGE(STATUS "Checking module ${SUBMODULE}")
	EXECUTE_PROCESS(
		COMMAND bash ${CMAKE_SOURCE_DIR}/scripts/cmake/SubmoduleCheck.sh ${SUBMODULE}
		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
		RESULT_VARIABLE SUBMODULE_IS_NOT_INITIALIZED
	)

	IF(SUBMODULE_IS_NOT_INITIALIZED)
		MESSAGE(STATUS "Initializing submodule ${SUBMODULE}")
		EXECUTE_PROCESS(
			COMMAND git submodule update --init ${SUBMODULE}
			WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
		)
	ENDIF()
ENDFOREACH()