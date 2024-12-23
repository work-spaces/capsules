"""
zlib capsule
"""

load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
cmake_add_create_capsule(
    domain = "github.com",
    owner = "madler",
    repo = "zlib",
    version = "1.3.1",
)

