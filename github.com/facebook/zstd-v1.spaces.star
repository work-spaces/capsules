"""
zstd capsule
"""

load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
cmake_add_create_capsule(
    domain = "github.com",
    owner = "facebook",
    repo = "zstd",
    version = "1.5.5",
    relative_source_directory = "build/cmake",
    checkout_submodules = True
)
