"""
nghttp2 capsule
"""

load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
cmake_add_create_capsule(
    domain = "github.com",
    owner = "nghttp2",
    repo = "nghttp2",
    version = "1.64.0",
    checkout_submodules = True
)
