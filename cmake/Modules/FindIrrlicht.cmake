
mark_as_advanced(IRRLICHT_LIBRARY IRRLICHT_INCLUDE_DIR IRRLICHT_DLL)

# Find include directory and libraries

# find our fork first, then upstream (TODO: remove this?)
foreach(libname IN ITEMS IrrlichtMt Irrlicht)
	string(TOLOWER "${libname}" libname2)

	find_path(IRRLICHT_INCLUDE_DIR NAMES irrlicht.h
		DOC "Path to the directory with IrrlichtMt includes"
		PATHS
		/usr/local/include/${libname2}
		/usr/include/${libname2}
		/system/develop/headers/${libname2} #Haiku
		PATH_SUFFIXES "include/${libname2}"
	)

	find_library(IRRLICHT_LIBRARY NAMES lib${libname} ${libname}
		DOC "Path to the IrrlichtMt library file"
		PATHS
		/usr/local/lib
		/usr/lib
		/system/develop/lib # Haiku
	)

	if(IRRLICHT_INCLUDE_DIR OR IRRLICHT_LIBRARY)
		break()
	endif()
endforeach()

# Users will likely need to edit these
mark_as_advanced(CLEAR IRRLICHT_LIBRARY IRRLICHT_INCLUDE_DIR)

# On Windows, find the DLL for installation
if(WIN32)
	# If VCPKG_APPLOCAL_DEPS is ON, dll's are automatically handled by VCPKG
	if(NOT VCPKG_APPLOCAL_DEPS)
		find_file(IRRLICHT_DLL NAMES IrrlichtMt.dll
			DOC "Path of the IrrlichtMt dll (for installation)"
		)
	endif()
endif(WIN32)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Irrlicht DEFAULT_MSG IRRLICHT_LIBRARY IRRLICHT_INCLUDE_DIR)

