"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "ea9941faac8ad00090afa1b4771ed9b8ff92a5b8",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)