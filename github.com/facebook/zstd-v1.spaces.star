"""
zstd capsule


load("//@star/capsules/star/capsules.star", CAPSULE = "GITHUB_COM_FACEBOOK_ZSTD_V1")
load("//@star/capsules/star/cmake.star", "cmake_add_build_install_publish")
cmake_add_build_install_publish(
    CAPSULE,
    relative_source_directory = "build/cmake",
    checkout_submodules = True)

"""
