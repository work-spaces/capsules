"""
Capsules rules
"""

load("//@star/sdk/star/checkout.star", "checkout_add_soft_link_asset")
load(
    "//@star/sdk/star/info.star",
    "info_get_absolute_path_to_workspace",
    "info_get_path_to_checkout",
)
load("//@star/capsules/star/capsules.star", GITHUB_COM_MADLER_ZLIB_V1 = "GITHUB_COM_MADLER_ZLIB_V1")
load("//@star/capsules/star/cmake.star", "cmake_add_build_install_publish")

WORKSPACE = info_get_absolute_path_to_workspace()
CHECKOUT_PATH = "{}/{}".format(WORKSPACE, info_get_path_to_checkout())

checkout_add_soft_link_asset(
    "star",
    source = "{}/star".format(CHECKOUT_PATH),
    destination = "@star/capsules/star",
)

# add cmake
# add spaces

cmake_add_build_install_publish(GITHUB_COM_MADLER_ZLIB_V1)

