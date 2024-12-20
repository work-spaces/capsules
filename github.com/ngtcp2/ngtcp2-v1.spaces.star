"""

nghttp3 capsule

"""

load("//@sdk/sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@sdk/sdk/star/capsule.star", "capsule")
load("//@sdk/sdk/star/spaces-sdk.star", "spaces_add")

def checkout_function():
    spaces_add("spaces0", "v0.11.4")
    cmake_add("cmake3", "v3.31.1")

# depends on brotli, nghttp3, and openssl

capsule_name = "ngtcp2"
version = "1.9.1"
rev = "v{}".format(version)

cmake_capsule_add_repo_checkout_and_run(
    capsule_name,
    capsule = capsule("github.com", "ngtcp2", capsule_name),
    rev = rev,
    version = version,
    oras_url = "ghcr.io/work-spaces",
    checkout_function = checkout_function,
    checkout_submodules = True
)

spaces_working_env()
