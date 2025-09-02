These ports are just a copy of the vcpkg ports, based on the PR [vcpkg#38650](https://github.com/microsoft/vcpkg/pull/36850)

* we added `ports/opencv4/0100-fix-pkgconfig-pc.patch` to fix generation of `pkgconfig/opencv4.pc` on Windows
* we copied the `ports/cudnn-frontend` and `ports/onnxruntime` just from #36850
* we updated the version of `ports/eigen3` to the latest commit on the `3.4` branch (and remove all patches that are already upstreamed), based on the [fork](https://github.com/luncliff/vcpkg-registry/blob/main/ports/eigen3/portfile.cmake)
* we patched `ports/onnx` to support flag `ONNX_DISABLE_STATIC_REGISTRATION` (see [vcpkg#38879](https://github.com/microsoft/vcpkg/pull/38879))

## Releases

This repository automatically builds and publishes prebuilt artifacts when version tags are created. To create a new release:

1. Create and push a version tag (e.g., `v1.0.0`):
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```

2. The GitHub Actions workflow will automatically:
   - Build artifacts for Linux (x64-linux-mixed), macOS (arm64-osx-mixed), and Windows (x64-windows-mixed)
   - Create a GitHub release with the tag name
   - Attach prebuilt ZIP files for each platform to the release

3. Users can download the prebuilt artifacts from the [Releases page](../../releases)
