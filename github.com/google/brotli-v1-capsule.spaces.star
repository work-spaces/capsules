"""
brotli capsule
"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@sdk/star/capsule.star", "capsule")
load("//@sdk/star/spaces-sdk.star", "spaces_add")


def checkout_function():
    spaces_add("spaces0", "v0.11.4")
    cmake_add("cmake3", "v3.31.1")

version = "1.1.0"
rev = "v{}".format(version)

spaces_working_env()

cmake_capsule_add_repo_checkout_and_run(
    "brotli",
    capsule = capsule("github.com", "google", "brotli"),
    rev = rev,
    version = version,
    checkout_function = checkout_function,
    oras_url = "ghcr.io/work-spaces",
)
