"""
zstd capsule
"""

load("//@star/capsules/star/capsules.star", CAPSULE = "GITHUB_COM_FACEBOOK_ZSTD_V1")
cmake_add_build_install_publish(
    CAPSULE,
    relative_source_directory = "build/cmake",
    checkout_submodules = True)

