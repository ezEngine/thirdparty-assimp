### Global variable whether to enable Advanced Docking System support
set (EZ_3RDPARTY_ASSIMP_SUPPORT ON CACHE BOOL "Whether to add support for the asset import library (assimp).")
mark_as_advanced(FORCE EZ_3RDPARTY_ASSIMP_SUPPORT)

macro(ez_requires_assimp)

	ez_requires(EZ_3RDPARTY_ASSIMP_SUPPORT)
	ez_requires_one_of(EZ_CMAKE_PLATFORM_WINDOWS_DESKTOP EZ_CMAKE_PLATFORM_LINUX)

endmacro()
