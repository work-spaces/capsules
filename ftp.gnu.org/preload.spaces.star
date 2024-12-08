"""
Preload script capsules.
"""

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "4f6e6f1ae520f1627cf552dbdd2cb2a20b9112fc",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)

gnu_star = '''
"""
Helper functions for GNU capsules
"""

load(
    "//@sdk/star/capsule.star",
    "capsule_add",
    "capsule_add_workflow_repo",
)

def gnu_add_autotools_capsule():
    """
    Add the autotools capsule
    """

    capsule_add_workflow_repo(
        "capsules",
        url = "https://github.com/work-spaces/capsules",
        rev = "a2d7ba48a24eed157b706886d2368c07475f8c7e",
    )

    libtool2 = capsule_dependency("ftp.gnu.org", "libtool", "libtool", semver = "2")
    automake1 = capsule_dependency("ftp.gnu.org", "automake", "automake", semver = "1")
    autoconf2 = capsule_dependency("ftp.gnu.org", "autoconf", "autoconf", semver = ">=2.65")

    capsule_add(
        "autotools_capsule",
        required = [libtool2, automake1, autoconf2],
        scripts = ["capsules/ftp.gnu.org/preload", "capsules/ftp.gnu.org/autotools-capsule"],
        deps = ["@capsules/capsules"],
        prefix = "sysroot",
    )

'''

checkout.add_asset(
    rule = {"name": "gnu_star"},
    asset = {
        "content": gnu_star,
        "destination": "gnu.star",
    }
)