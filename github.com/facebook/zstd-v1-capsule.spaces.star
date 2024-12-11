"""
zstd capsule
"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@sdk/star/spaces-sdk.star", "spaces_add")

spaces_add("spaces0", "v0.11.4")
cmake_add("cmake3", "v3.31.1")

version = "1.5.5"
rev = "v{}".format(version)

# Need to provide xz and lz4 as dependencies

cmake_capsule_add_repo_checkout_and_run(
    capsule_name = "zstd",
    domain = "github.com",
    owner = "facebook",
    repo = "zstd",
    rev = rev,
    version = version,
    relative_source_directory = "build/cmake",
    deploy_repo = "https://github.com/work-spaces/capsules",
)

spaces_working_env()
