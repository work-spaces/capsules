"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk/sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "main",
        "checkout": "Revision",
        "clone": "Worktree"
    }
)