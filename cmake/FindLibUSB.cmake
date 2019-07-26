#[==============================================[
FindLibUSB
-----------

Searching libusb-1.0 library and creating imported
target LibUSB::LibUSB

#]==============================================]

# TODO Append parts for Version compasion and REQUIRED support

if (MSVC OR MINGW)
    return()
endif()

if (NOT TARGET LibUSB::LibUSB)

    add_library(LibUSB::LibUSB
      SHARED IMPORTED
    )
    if (DEFINED LibUSB_INCLUDE_DIRS)
      set_target_properties(LibUSB::LibUSB PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES ${LibUSB_INCLUDE_DIRS}
      )
    endif()
    set_target_properties(LibUSB::LibUSB PROPERTIES
      IMPORTED_LINK_INTERFACE_LANGUAGES "C"
      IMPORTED_LOCATION ${LibUSB_LIBRARY}
    )

else()
  message(WARNING "libusb-1.0 could not be found using pkgconfig")
endif()
