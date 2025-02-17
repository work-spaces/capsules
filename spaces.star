"""
Capsules rules
"""

load("//@star/sdk/star/checkout.star", "checkout_add_soft_link_asset")
load(
    "//@star/sdk/star/info.star",
    "info_get_absolute_path_to_workspace",
    "info_get_path_to_checkout",
)

WORKSPACE = info_get_absolute_path_to_workspace()
CHECKOUT_PATH = "{}/{}".format(WORKSPACE, info_get_path_to_checkout())

checkout_add_soft_link_asset(
    "star",
    source = "{}/star".format(CHECKOUT_PATH),
    destination = "@star/capsules/star",
)


