"""

libxml2 capsule

"""

load("//@star/packages/star/cmake.star", "cmake_add")
load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
load("//@star/capsules/star/gnu.star", "gnu_add_autotools_capsule")
load("//@star/capsules/star/self.star", "self_gnu_capsule_checkout")

def _checkout_function(install_path):
    env_rule = gnu_add_autotools_capsule()
    cmake_add("cmake3", "v3.31.1")

    self_gnu_capsule_checkout(
        "libiconv",
        "v1",
        prefix = install_path,
        checkout_deps = [env_rule],
    )

cmake_add_create_capsule(
    domain = "github.com",
    owner = "GNOME",
    repo = "libxml2",
    version = "2.13.5",
    checkout_function = _checkout_function,
)
