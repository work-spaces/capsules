"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "6b2ff503464ac4d0119901fab2f6fceb55d1b8d8",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)