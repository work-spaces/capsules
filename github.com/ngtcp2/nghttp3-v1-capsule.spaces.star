"""

nghttp3 capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@sdk/star/capsule.star", "capsule")
load("//@sdk/star/spaces-sdk.star", "spaces_add")

spaces_add("spaces0", "v0.11.4")
cmake_add("cmake3", "v3.31.1")

capsule_name = "nghttp3"
version = "1.6.0"
rev = "v{}".format(version)

cmake_capsule_add_repo_checkout_and_run(
    capsule_name = capsule_name,
    capsule = capsule("github.com", "ngtcp2", capsule_name),
    owner = "ngtcp2",
    repo = capsule_name,
    rev = rev,
    version = version,
    oras_url = "ghcr.io/work-spaces",
    checkout_submodules = True
)

spaces_working_env()
