

##
# Includes
##

INCLUDE ( ${CMAKE_MODULE_PATH}/base_definitions.cmake )


##
# Clear variables/caches
##

SET( NBCOMMON_DEFINITIONS
	-DROBOT_TYPE=${ROBOT_TYPE}
	)
SET( NBCOMMON_INCLUDE_DIR "NBCOMMON_INCLUDE_DIR-NOTFOUND" CACHE FILEPATH "Cleared." FORCE )
SET( NBCOMMON_LIBRARIES "NBCOMMON_LIBRARIES-NOTFOUND" CACHE FILEPATH "Cleared." FORCE )

IF( STRAIGHT )
  SET( NBCOMMON_DEFINITIONS "${NBCOMMON_DEFINITIONS} -DSTRAIGHT " )
ENDIF( STRAIGHT )

##
# Defined package variable
##

SET( NBCOMMON_INCLUDE_DIR "${TRUNK_PATH}/include" )
SET( NBCOMMON_LIBRARIES "" )
SET( NBCOMMON_LIB_DIR "${TRUNK_PATH}/lib" )

SET( MAN_INCLUDE_DIR    ${TRUNK_PATH}                   )
SET( COMM_INCLUDE_DIR   ${MAN_INCLUDE_DIR}/comm         )
SET( CORPUS_INCLUDE_DIR ${MAN_INCLUDE_DIR}/corpus       )
SET( MOTION_INCLUDE_DIR ${MAN_INCLUDE_DIR}/motion       )
SET( NOGGIN_INCLUDE_DIR ${MAN_INCLUDE_DIR}/noggin     )
SET( VISION_INCLUDE_DIR ${MAN_INCLUDE_DIR}/vision     )


SET( COMM_CMAKE_DIR       ${COMM_INCLUDE_DIR}/cmake.comm         )
SET( CORPUS_CMAKE_DIR     ${CORPUS_INCLUDE_DIR}/cmake.man.corpus )
SET( MAN_CMAKE_DIR        ${MAN_INCLUDE_DIR}/cmake.man           )
SET( MOTION_CMAKE_DIR     ${MOTION_INCLUDE_DIR}/cmake.man.motion )
SET( NOGGIN_CMAKE_DIR     ${NOGGIN_INCLUDE_DIR}/cmake.noggin     )
SET( VISION_CMAKE_DIR     ${VISION_INCLUDE_DIR}/cmake.vision     )


SET( COMM_TARGET        _comm      )
SET( LEDS_TARGET        _leds      )
SET( MAN_TARGET         man        )
SET( MATRIX_TARGET      matrix     )
SET( MOTION_TARGET      _motion    )
SET( NOGGIN_TARGET      noggin     )
SET( SENSORS_TARGET     _sensors   )
SET( SYNCHRO_TARGET     _synchro   )
SET( ROBOT_CONNECT_TARGET     _robot_connect   )
SET( NBINCLUDE_TARGET     _nb_include   )
SET( VISION_TARGET      vision     )
IF ( VISIONLINK )
  SET( VISIONLINK_TARGET TOOLVisionLink )
ENDIF( VISIONLINK )

SET( MAN_PYTHON_TARGET_DIR    ${OUTPUT_ROOT_DIR_LIB}/man        )
SET( COMM_PYTHON_TARGET_DIR   ${MAN_PYTHON_TARGET_DIR}/comm     )
SET( CORPUS_PYTHON_TARGET_DIR ${MAN_PYTHON_TARGET_DIR}/corpus   )
SET( MOTION_PYTHON_TARGET_DIR ${MAN_PYTHON_TARGET_DIR}/motion   )
SET( NOGGIN_PYTHON_TARGET_DIR ${MAN_PYTHON_TARGET_DIR}/noggin )
SET( VISION_PYTHON_TARGET_DIR ${MAN_PYTHON_TARGET_DIR}/vision )


IF( EXISTS ${NBCOMMON_INCLUDE_DIR} )
  SET( NBCOMMON_FOUND TRUE )
  FOREACH( dir ${NBCOMMON_LIBRARIES} )
    IF ( NOT EXISTS ${dir} )
      SET( NBCOMMON_FOUND FALSE )
    ENDIF ( NOT EXISTS ${dir} )
  ENDFOREACH( dir ${NBCOMMON_LIBRARIES} )
ENDIF( EXISTS ${NBCOMMON_INCLUDE_DIR} )

IF( NOT NBCOMMON_FOUND AND NBCOMMON_FIND_REQUIRED )
  IF( NOT NBCOMMON_INCLUDE_DIR )
		MESSAGE( STATUS "Required include not found" )
    MESSAGE( FATAL_ERROR "Could not find NBCOMMON include!" )
  ENDIF( NOT NBCOMMON_INCLUDE_DIR )
  IF( NOT NBCOMMON_LIBRARIES )
  	MESSAGE( STATUS "Required libraries not found" )
    MESSAGE( FATAL_ERROR "Could not find NBCOMMON libraries!" )
  ENDIF( NOT NBCOMMON_LIBRARIES )
ENDIF( NOT NBCOMMON_FOUND AND NBCOMMON_FIND_REQUIRED )


##
# Finally, display informations if not in quiet mode
##

IF( NOT NBCOMMON_FIND_QUIETLY )
  MESSAGE( STATUS "NBCOMMON found " )
  MESSAGE( STATUS "  robot name : ${ROBOT_PREFIX}" )
  MESSAGE( STATUS "  includes   : ${NBCOMMON_INCLUDE_DIR}" )
  MESSAGE( STATUS "  libraries  : ${NBCOMMON_LIBRARIES}" )
  MESSAGE( STATUS "  definitions: ${NBCOMMON_DEFINITIONS}" )
ENDIF( NOT NBCOMMON_FIND_QUIETLY )



MARK_AS_ADVANCED(
  NBCOMMON_INCLUDE_DIR
  NBCOMMON_LIBRARIES
)
