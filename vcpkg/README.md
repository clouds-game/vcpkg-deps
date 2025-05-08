These ports are just a copy of the vcpkg ports, based on the PR [vcpkg#38650](https://github.com/microsoft/vcpkg/pull/36850)

* we added `ports/opencv4/0100-fix-pkgconfig-pc.patch` to fix generation of `pkgconfig/opencv4.pc` on Windows
* we copied the `ports/cudnn-frontend` and `ports/onnxruntime` just from #36850
* we updated the version of `ports/eigen3` to the latest commit on the `3.4` branch (and remove all patches that are already upstreamed), based on the [fork](https://github.com/luncliff/vcpkg-registry/blob/main/ports/eigen3/portfile.cmake)
* we patched `ports/onnx` to support flag `ONNX_DISABLE_STATIC_REGISTRATION` (see [vcpkg#38879](https://github.com/microsoft/vcpkg/pull/38879))
