"""
brotli capsule
"""

load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
cmake_add_create_capsule(
    domain = "github.com",
    owner = "google",
    repo = "brotli",
    version = "1.1.0"
)


