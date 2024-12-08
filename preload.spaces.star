"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "f116fa67c1d03f11c3e402708bd99099a6b973db",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)