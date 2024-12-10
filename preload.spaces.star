"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "2edbcf8a5f04eb227c8ab89fb103258745c43890",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)