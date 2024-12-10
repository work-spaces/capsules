"""

libxml2 capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@sdk/star/spaces-sdk.star", "spaces_add")

spaces_add("spaces0", "v0.11.4")

cmake_add(
    "cmake3",
    version = "v3.31.1",
)

cmake_capsule_add_repo_checkout_and_run(
    capsule_name = "libxml2",
    domain = "github.com",
    owner = "GNOME",
    repo = "libxml2",
    rev = "v2.13.5",
    version = "2.13.5",
    deploy_repo = "https://github.com/work-spaces/capsules",
)

spaces_working_env()