"""
Capsules rules
"""

load("//@star/sdk/star/checkout.star", "checkout_add_soft_link_asset")
load("//@star/sdk/star/info.star", "info_get_path_to_checkout")

checkout_add_soft_link_asset(
    "star",
    source = "{}/star".format(info_get_path_to_checkout()),
    destination = "@star/capsules/star"
)