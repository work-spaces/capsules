"""
Helper functions for GNU capsules
"""

load("//@star/packages/star/spaces-cli.star", "spaces_add")
load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load("self.star", "self_gnu_capsule_checkout")

def gnu_add_autotools_capsule():
    """
    Add the autotools capsule
    """

    spaces_add("spaces0", "v0.11.4")
    env_rule = spaces_working_env()

    self_gnu_capsule_checkout("autotools-v2024", 
        checkout_deps = [env_rule],
        prefix = "sysroot",
    )
