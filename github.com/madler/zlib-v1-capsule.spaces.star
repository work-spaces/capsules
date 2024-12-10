"""

zlib capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")

cmake_add(
    "cmake3",
    version = "v3.31.1",
)

cmake_capsule_add_repo_checkout_and_run(
    capsule_name = "zlib",
    domain = "github.com",
    owner = "madler",
    repo = "zlib",
    version = "1.3.1",
    deploy_repo = "https://github.com/work-spaces/capsules",
)

spaces_working_env()
