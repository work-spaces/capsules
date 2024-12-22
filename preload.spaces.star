"""
Preload script capsules.
"""


_name = "capsules"
_rule_name = "{}_soft_link_parent".format(_name)
_capsule_path = info.get_path_to_capsule_workspace()
_workspace = info.get_absolute_path_to_workspace()
_source = "{}/../{}".format(_workspace, _name)

# This will make this repo available to the capsules
# allowing capsules to use starlark modules in the star
# directory and to add capsule dependencies
checkout.add_soft_link_asset(
    rule = {"name": _rule_name},
    asset = {
        "source": _source,
        "destination": "{}/{}".format(_capsule_path, _name),
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
