### Assimp
set (EZ_3RDPARTY_ASSIMP_SUPPORT ON CACHE BOOL "Whether to add support for the asset importer.")
mark_as_advanced(FORCE EZ_3RDPARTY_ASSIMP_SUPPORT)

set (EZ_3RDPARTY_ASSIMP_DRACO_SUPPORT OFF CACHE BOOL "Whether to include Draco mesh compression support in AssImp.")
mark_as_advanced(FORCE EZ_3RDPARTY_ASSIMP_DRACO_SUPPORT)

macro(ez_requires_assimp)
	
	ez_requires(EZ_3RDPARTY_ASSIMP_SUPPORT)
	ez_requires_one_of(EZ_CMAKE_PLATFORM_LINUX EZ_CMAKE_PLATFORM_WINDOWS_DESKTOP)

endmacro()
