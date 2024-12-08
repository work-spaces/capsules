"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "46518466478f0d918374aa390043b980e0eb5649",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)