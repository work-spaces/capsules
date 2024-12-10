"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "2bbb6f2561b729ede8e7e38c9670a68c3147df26",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)