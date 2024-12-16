"""
zlib capsule
"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@sdk/star/capsule.star", "capsule")
load("//@sdk/star/spaces-sdk.star", "spaces_add")

spaces_add("spaces0", "v0.11.4")

cmake_add(
    "cmake3",
    version = "v3.31.1",
)

version = "1.3.1"
rev = "v{}".format(version)
capsule_name = "zlib"

cmake_capsule_add_repo_checkout_and_run(
    capsule_name,
    capsule = capsule("github.com", "madler", capsule_name),
    rev = rev,
    version = version,
    oras_url = "ghcr.io/work-spaces",
)

spaces_working_env()
