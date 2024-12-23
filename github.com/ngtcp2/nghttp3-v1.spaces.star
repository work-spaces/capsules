"""

nghttp3 capsule

"""

load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
cmake_add_create_capsule(
    domain = "github.com",
    owner = "ngtcp2",
    repo = "nghttp3",
    version = "1.6.0",
    checkout_submodules = True
)

