"""

libxml2 capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@sdk/star/capsule.star", "capsule")
load("//@sdk/star/spaces-sdk.star", "spaces_add")

def checkout_function():
    spaces_add("spaces0", "v0.11.4")
    cmake_add("cmake3", "v3.31.1")


cmake_capsule_add_repo_checkout_and_run(
    "libxml2",
    capsule = capsule("github.com", "GNOME", "libxml2"),
    rev = "v2.13.5",
    version = "2.13.5",
    checkout_function = checkout_function,
    oras_url = "ghcr.io/work-spaces",
)

spaces_working_env()