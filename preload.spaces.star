"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "9f1786df43718d6c5d2e9bf3e084f17ec0d2215c",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)