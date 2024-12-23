"""

xz capsule

"""

load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
cmake_add_create_capsule(
    domain = "github.com",
    owner = "tukaani-project",
    repo = "xz",
    version = "5.6.3",
    configure_args = [
        "-DBUILD_SHARED_LIBS=ON",
    ]
)

