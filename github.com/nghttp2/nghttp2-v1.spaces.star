"""

nghttp2 capsule

"""

load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load("//@star/sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@star/sdk/star/capsule.star", "capsule")
load("//@star/sdk/star/spaces-sdk.star", "spaces_add")

def checkout_function():
    spaces_add("spaces0", "v0.11.4")
    cmake_add("cmake3", "v3.31.1")

capsule_name = "nghttp2"
version = "1.64.0"
rev = "v{}".format(version)

cmake_capsule_add_repo_checkout_and_run(
    capsule_name,
    capsule = capsule("github.com", "nghttp2", capsule_name),
    rev = rev,
    version = version,
    oras_url = "ghcr.io/work-spaces",    
    checkout_function = checkout_function,
    checkout_submodules = True
)

spaces_working_env()
