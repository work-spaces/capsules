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

gnu_star = '''
"""
Helper functions for GNU capules
"""

load(
    "//@sdk/star/capsule.star",
    "capsule_add",
    "capsule_checkout_define_dependency",
    "capsule_dependency",
    "capsule_get_install_path",
)

load(
    "//@sdk/star/checkout.star",
    "checkout_add_repo",
)

load(
    "//@sdk/star/gnu-autotools.star",
    "gnu_add_configure_make_install_from_source",
)


def gnu_add_autotools_capsule():
    """
    Add the autotools capsule
    """
    checkout_add_repo(
        "@capsules/capsules",
        url = "https://github.com/work-spaces/capsules",
        rev = "5e8c9f6b02e789d1a6946ee2a1505e8ae0e2dfa4",
        clone = "Default",
        is_evaluate_spaces_modules = False,
    )

    libtool2 = capsule_dependency("ftp.gnu.org", "libtool", "libtool", semver = "2")
    automake1 = capsule_dependency("ftp.gnu.org", "automake", "automake", semver = "1")
    autoconf2 = capsule_dependency("ftp.gnu.org", "autoconf", "autoconf", semver = ">=2.65")

    capsule_add(
        "autotools_capsule",
        required = [libtool2, automake1, autoconf2],
        scripts = ["capsules/preload", "capsules/gnu/autotools-capsule"],
        deps = ["@capsules/capsules"],
        prefix = "sysroot",
    )

def gnu_define_dependency(capsule_name, owner, repo, version):
    capsule_checkout_define_dependency(
        "{{}}_info".format(capsule_name),
        capsule_name = capsule_name,
        domain = "ftp.gnu.org",
        owner = owner,
        repo = repo,
        version = version,
    )

def gnu_add_checkout_and_run(capsule_name, owner, repo, version):
    """
    Add the checkout and run if the install path does not exist

    Args:
        capsule_name: The name of the capsule
        owner: The owner of the repository
        repo: The repository name
        version: The version of the repository
    """

    gnu_define_dependency(capsule_name, owner, repo, version)

    install_path = capsule_get_install_path(capsule_name)
    if install_path != None:

        gnu_add_configure_make_install_from_source(
            "{{}}_from_source".format(capsule_name),
            owner,
            repo,
            version,
            install_path = install_path,
        )
'''

checkout.add_asset(
    rule = {"name": "gnu_star"},
    asset = {
        "content": gnu_star,
        "destination": "gnu.star",
    }
)