"""
libyaml capsule
"""

load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
cmake_add_create_capsule(
    domain = "github.com",
    owner = "yaml",
    repo = "libyaml",
    version = "0.2.5",
    rev = "0.2.5"
)

