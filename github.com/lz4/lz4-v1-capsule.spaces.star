"""

lz4 capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@sdk/star/spaces-sdk.star", "spaces_add")

spaces_add("spaces0", "v0.11.4")

cmake_add("cmake3", "v3.31.1")

version = "1.10.0"
rev = "v{}".format(version)

cmake_capsule_add_repo_checkout_and_run(
    capsule_name = "lz4",
    domain = "github.com",
    owner = "lz4",
    repo = "lz4",
    rev = rev,
    version = version,
    relative_source_directory = "build/cmake",
    deploy_repo = "https://github.com/work-spaces/capsules",
)

spaces_working_env()
