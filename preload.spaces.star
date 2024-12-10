"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "d096d2562469c2497ee80718982c890cb1c9fd04",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)