"""

ngtcp2 capsule

"""

load("//@star/capsules/star/cmake.star", "cmake_add_create_capsule")
load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load("//@star/packages/star/spaces-cli.star", "spaces_add")
load("//@star/packages/star/cmake.star", "cmake_add")
load(
    "//@star/capsules/star/self.star",
    "self_capsule_checkout",
)

def _checkout_function(_install_path):
    spaces_add("spaces0", "v0.11.4")
    cmake_add("cmake3", "v3.31.1")
    env_rule = spaces_working_env()

    self_capsule_checkout("github.com", "google", "brotli-v1", "build/install", checkout_deps = [env_rule])
    self_capsule_checkout("github.com", "ngtcp2", "nghttp3-v1", "build/install", checkout_deps = [env_rule])
    self_capsule_checkout("github.com", "quictls", "openssl-v3", "build/install", checkout_deps = [env_rule])


cmake_add_create_capsule(
    domain = "github.com",
    owner = "ngtcp2",
    repo = "ngtcp2",
    version = "1.9.1",
    checkout_function = _checkout_function,
    checkout_submodules = True
)
