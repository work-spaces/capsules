"""
GNU capsule
"""

load("//@star/capsules/star/gnu.star", "gnu_add_create_capsule", "gnu_add_autotools_capsule")
load("//@star/capsules/star/self.star", "self_gnu_capsule_checkout")

def _checkout_function(install_path):
    gnu_add_autotools_capsule()

    self_gnu_capsule_checkout(
        "gettext-v0",
        prefix = install_path,
    )

gnu_add_create_capsule("readline", "8.2", checkout_function = _checkout_function)