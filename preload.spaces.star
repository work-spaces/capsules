"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "9581d1cb975d7d6b652ec5d22269e458f5b5a4da",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)