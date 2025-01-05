"""
Preload script capsules.
"""

info.set_max_queue_count(1)

_workflows_path = info.get_path_to_capsule_workflows()
_name = "capsules"

_source = "{}/{}/starlark".format(_workflows_path, _name)
_star_rule_name = "{}_soft_link_star".format(_name)

# Add loadable star modules to the @star folder under capsules
checkout.add_soft_link_asset(
    rule = {"name": _star_rule_name },
    asset = {
        "source": _source,
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


checkout.add_repo(
    rule = {"name": "@star/sources"},
    repo = {
        "url": "https://github.com/work-spaces/sources",
        "rev": "main",
        "checkout": "Revision",
        "clone": "Worktree"
    }
)

