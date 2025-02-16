"""
zlib capsule
"""

load(
    "//@star/sdk/star/capsule.star",
    "capsule_checkout_add_repo",
    "capsule_publish",
)

load("//@star/capsules/star/capsules.star", CAPSULE = "GITHUB_COM_MADLER_ZLIB_V1")
load("//@star/sdk/star/cmake.star", "cmake_add_configure_build_install")

capsule_checkout_add_repo(CAPSULE, "build")
cmake_add_configure_build_install(
    "build",
    source_directory = capsule_get_workspace_path(CAPSULE),
)
capsule_publish(CAPSULE, deps = ["build"])

