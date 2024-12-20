"""
Preload script capsules.
"""

gnu_star = '''
"""
Helper functions for GNU capsules
"""

load(
    "//@sdk/star/capsule.star",
    "capsule_checkout_add_workflow_repo_as_soft_link",
    "capsule_checkout"
)
load("//@sdk/star/spaces-sdk.star", "spaces_add")
load("//@sdk/star/spaces-env.star", "spaces_working_env")

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

'''

checkout.add_asset(
    rule = {"name": "gnu_star"},
    asset = {
        "content": gnu_star,
        "destination": "gnu.star",
    }
)

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "main",
        "checkout": "Revision",
        "clone": "Worktree"
    }
)

checkout.add_repo(
    rule = {"name": "@sources"},
    repo = {
        "url": "https://github.com/work-spaces/sources",
        "rev": "main",
        "checkout": "Revision",
        "clone": "Worktree"
    }
)