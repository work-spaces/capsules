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
    "capsule_add_workflow_repo_as_soft_link"
)

def gnu_add_autotools_capsule():
    """
    Add the autotools capsule

    Returns:
        The name of the checkout capsules rule
    """

    checkout_capsules_rule_name = capsule_add_workflow_repo_as_soft_link("capsules")

    libtool2 = capsule_dependency("ftp.gnu.org", "libtool", "libtool", semver = "2")
    automake1 = capsule_dependency("ftp.gnu.org", "automake", "automake", semver = "1")
    autoconf2 = capsule_dependency("ftp.gnu.org", "autoconf", "autoconf", semver = ">=2.65")

    capsule_add(
        "autotools_capsule",
        required = [libtool2, automake1, autoconf2],
        scripts = ["capsules/ftp.gnu.org/preload", "capsules/ftp.gnu.org/autotools-v2024-capsule"],
        deps = [checkout_capsules_rule_name],
        prefix = "sysroot",
    )

    return checkout_capsules_rule_name

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
        "rev": "3605517d8f483873c67542ed92e5167a84cd647f",
        "checkout": "Revision",
        "clone": "Blobless"
    }
)