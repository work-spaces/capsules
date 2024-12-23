"""

lz4 capsule

"""

load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
cmake_add_create_capsule(
    domain = "github.com",
    owner = "lz4",
    repo = "lz4",
    version = "1.10.0",
    relative_source_directory = "build/cmake",
)
