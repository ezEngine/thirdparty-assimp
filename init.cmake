### Global variable whether to enable Advanced Docking System support
set (EZ_3RDPARTY_ASSIMP_SUPPORT ON CACHE BOOL "Whether to add support for the asset import library (assimp).")
mark_as_advanced(FORCE EZ_3RDPARTY_ASSIMP_SUPPORT)

macro(ez_requires_assimp)

	ez_requires_windows()
	if (EZ_CMAKE_PLATFORM_WINDOWS_UWP)
		return()
	endif()

endmacro()
