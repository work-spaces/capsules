"""

zlib capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@sdk/star/spaces-sdk.star", "spaces_add")

spaces_add("spaces0", "v0.11.4")

cmake_add(
    "cmake3",
    version = "v3.31.1",
)

version = "1.3.1"
rev = "v{}".format(version)

cmake_capsule_add_repo_checkout_and_run(
    capsule_name = "zlib",
    domain = "github.com",
    owner = "madler",
    repo = "zlib",
    rev = rev,
    version = version,
    deploy_repo = "https://github.com/work-spaces/capsules",
)

spaces_working_env()
