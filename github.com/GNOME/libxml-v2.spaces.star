"""

libxml2 capsule

"""


load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
cmake_add_create_capsule(
    domain = "github.com",
    owner = "GNOME",
    repo = "libxml2",
    version = "2.13.5",
)
