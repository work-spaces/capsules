"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@star/sources"},
    repo = {
        "url": "https://github.com/work-spaces/sources",
        "rev": "main",
        "checkout": "Revision",
        "clone": "Worktree"
    }
)
