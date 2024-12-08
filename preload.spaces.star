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

gnu_star = fs.read_file_to_string("gnu/gnu.star")

checkout.add_asset(
    rule = {"name": "gnu_star"},
    asset = {
        "content": gnu_star,
        "destination": "gnu.star",
    }
)