ez_cmake_init()

ez_requires(EZ_3RDPARTY_ASSIMP_SUPPORT)

if(EZ_CMAKE_PLATFORM_WINDOWS)

  add_library(EzAssImp::EzAssImp SHARED IMPORTED GLOBAL)
  set_target_properties(EzAssImp::EzAssImp PROPERTIES IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/bin/assimp-vc143-mt.dll")
  set_target_properties(EzAssImp::EzAssImp PROPERTIES IMPORTED_IMPLIB "${CMAKE_CURRENT_SOURCE_DIR}/lib/assimp-vc143-mt.lib")
  set_target_properties(EzAssImp::EzAssImp PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/include")

  function(ez_link_target_assimp TARGET_NAME)
  
  	ez_requires_assimp()
  
  	target_link_libraries(${TARGET_NAME} PRIVATE EzAssImp::EzAssImp)
  
  	add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
  		COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:EzAssImp::EzAssImp> $<TARGET_FILE_DIR:${TARGET_NAME}>
  		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} )
  
  	add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
  		COMMAND ${CMAKE_COMMAND} -E copy_if_different "$<TARGET_FILE:EzAssImp::EzAssImp>/../draco.dll" $<TARGET_FILE_DIR:${TARGET_NAME}>
  		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} )
  
  endfunction()

else()
  find_package(assimp 5)
  if(NOT assimp_FOUND)
	message(FATAL_ERROR "Could not find assimp. Install it through your OS package manager 'libassimp-dev' or provide it through CMAKE_PREFIX_PATH")
  endif()

  function(ez_link_target_assimp TARGET_NAME)
	target_link_libraries(${TARGET_NAME} PRIVATE assimp)
  endfunction()

endif()