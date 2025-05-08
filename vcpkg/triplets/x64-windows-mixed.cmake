set(VCPKG_TARGET_ARCHITECTURE x64)

if(${PORT} MATCHES "opencv|onnxruntime")
  set(VCPKG_CRT_LINKAGE dynamic)
  set(VCPKG_LIBRARY_LINKAGE dynamic)
else()
  set(VCPKG_CRT_LINKAGE static)
  set(VCPKG_LIBRARY_LINKAGE static)
endif()

if(${PORT} MATCHES "opencv")
  list(APPEND VCPKG_CMAKE_CONFIGURE_OPTIONS "-DOPENCV_GENERATE_PKGCONFIG=ON")
endif()
