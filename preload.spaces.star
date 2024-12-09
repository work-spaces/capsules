"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "a1847da83f38de22fd3f70758a234cc64ea8589f",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)