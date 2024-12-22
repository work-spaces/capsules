"""
Preload script capsules.
"""


_name = "capsules"
_rule_name = "{}_soft_link_parent".format(_name)
_capsule_path = info.get_path_to_capsule_workspace()
_workspace = info.get_absolute_path_to_workspace()
_source = "{}/../{}".format(_workspace, _name)

# Soft link this repo so that it is available to nested capsule workspaces
checkout.add_soft_link_asset(
    rule = {"name": _rule_name},
    asset = {
        "source": _source,
        "destination": "{}/{}".format(_capsule_path, _name),
    },
)

_star_rule_name = "{}_soft_link_star".format(_name)

# Add loadable star modules to the @star folder under capsules
checkout.add_soft_link_asset(
    rule = {"name": _star_rule_name},
    asset = {
        "source": "{}/star".format(_source),
        "destination": "@star/capsules",
    },
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
