"""
Preload script capsules.
"""

gnu_star = '''
"""
Helper functions for GNU capsules
"""

load(
    "//@sdk/star/capsule.star",
    "capsule_dependency",
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
        rev = "c0cc9714cf05ee026b62f4c8398b07a15c5456a5",
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

checkout.add_repo(
    rule = {"name": "@sdk"},
    repo = {
        "url": "https://github.com/work-spaces/sdk",
        "rev": "5276d6f76181becc82fab0c2831c085f6fe88619",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)