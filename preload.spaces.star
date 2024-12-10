"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "a0eeee9e8e492fb5ca6296e56f0d7cdf0fd92999",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)