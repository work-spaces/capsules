"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "a9b9010332dd926e52cb3565c9e61c2739bec200",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)