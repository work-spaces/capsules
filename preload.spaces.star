"""
Preload script capsules.
"""

bootstrap_star = '''
"""
Capsule bootstrap function to bring the capsules workflow repo in the workspace
"""

load(
    "//@star/sdk/star/capsule.star",
    "capsule_checkout_add_workflow_repo_as_soft_link",
)

def bootstrap_add_self_as_soft_link():
    """
    Add the autotools capsule

    Returns:
        The name of the checkout capsules rule
    """

    return capsule_checkout_add_workflow_repo_as_soft_link("capsules")
'''

_name = "capsules"
_rule_name = "{}_soft_link_parent".format(_name)
_workspace = info.get_absolute_path_to_workspace()
_source = "{}/../{}".format(_workspace, _name)

checkout.add_soft_link_asset(
    rule = {"name": _rule_name},
    asset = {
        "source": _source,
        "destination": "@capsules/{}".format(_name),
    },
)

checkout.add_asset(
    rule = {"name": "bootstrap_star"},
    asset = {
        "content": bootstrap_star,
        "destination": "bootstrap.star",
    }
)

checkout.add_repo(
    rule = {"name": "@star/sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "main",
        "checkout": "Revision",
        "clone": "Worktree"
    }
)

checkout.add_repo(
    rule = {"name": "@star/packages"},
    repo = {
        "url": "https://github.com/work-spaces/packages",
        "rev": "main",
        "checkout": "Revision",
        "clone": "Worktree"
    }
)
