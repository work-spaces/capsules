"""
brotli capsule
"""

load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
cmake_add_create_capsule(
    domain = "github.com",
    owner = "google",
    repo = "brotli",
    version = "1.1.0",
    configure_args = [
        "-DCMAKE_SKIP_INSTALL_RPATH=ON",
    ]
)


