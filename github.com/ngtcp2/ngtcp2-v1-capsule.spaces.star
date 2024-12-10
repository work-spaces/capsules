"""

nghttp3 capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@sdk/star/spaces-sdk.star", "spaces_add")

spaces_add("spaces0", "v0.11.4")
cmake_add("cmake3", "v3.31.1")

# depends on brotli, nghttp3, and openssl

capsule_name = "ngtcp2"
version = "1.9.1"
rev = "v{}".format(version)

cmake_capsule_add_repo_checkout_and_run(
    capsule_name = capsule_name,
    domain = "github.com",
    owner = "ngtcp2",
    repo = capsule_name,
    rev = rev,
    version = version,
    deploy_repo = "https://github.com/work-spaces/capsules",
    # need submodules
)

spaces_working_env()
