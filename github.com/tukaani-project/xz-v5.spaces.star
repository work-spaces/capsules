"""

nghttp2 capsule

"""

load("//@sdk/sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@sdk/sdk/star/capsule.star", "capsule_github")
load("//@sdk/sdk/star/spaces-sdk.star", "spaces_add")

def checkout_function():
    spaces_add("spaces0", "v0.11.4")
    cmake_add("cmake3", "v3.31.1")

capsule_name = "xz"
version = "5.6.3"
rev = "v{}".format(version)

cmake_capsule_add_repo_checkout_and_run(
    capsule_name,
    capsule = capsule_github("tukaani-project", capsule_name),
    rev = rev,
    version = version,
    checkout_function = checkout_function,
    oras_url = "ghcr.io/work-spaces",
    configure_args = [
        "-DBUILD_SHARED_LIBS=ON",
    ]
)

spaces_working_env()
