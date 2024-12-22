"""
Helper functions for GNU capsules
"""

load(
    "//@star/sdk/star/capsule.star",
    "capsule_checkout_add_workflow_repo_as_soft_link",
    "capsule_checkout"
)
load("//@star/packages/star/spaces-cli.star", "spaces_add")
load("//@star/sdk/star/spaces-env.star", "spaces_working_env")

def gnu_add_autotools_capsule():
    """
    Add the autotools capsule

    Returns:
        The name of the checkout capsules rule
    """

    spaces_add("spaces0", "v0.11.4")
    env_rule = spaces_working_env()

    checkout_capsules_rule_name = capsule_checkout_add_workflow_repo_as_soft_link("capsules")

    capsule_checkout(
        "autotools",
        scripts = ["capsules/ftp.gnu.org/preload", "capsules/ftp.gnu.org/autotools-v2024"],
        deps = [checkout_capsules_rule_name, env_rule],
        prefix = "sysroot",
    )

    return checkout_capsules_rule_name