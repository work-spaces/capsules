"""

ngtcp2 capsule

"""

load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
cmake_add_create_capsule(
    domain = "github.com",
    owner = "ngtcp2",
    repo = "ngtcp2",
    version = "1.9.1",
    checkout_submodules = True
)
