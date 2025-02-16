"""
Helper functions for GNU capsules
"""

load("//@star/packages/star/spaces-cli.star", "spaces_add")
load("//@star/sources/star/gnu.star", "gnu_add_configure_make_install_from_source")
load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load(
    "self.star",
    "GH_DEPLOY_REPO",
    "ORAS_URL",
    "SELF_SPACES_VERSION",
    "self_gnu_capsule_checkout",
)
load(
    "//@star/sdk/star/capsule.star",
    "capsule",
    "capsule_add_checkout_and_run",
)

def gnu_add_autotools_capsule():
    """
    Add the autotools capsule

    Returns:
        The environment rule
    """

    spaces_add("spaces0", SELF_SPACES_VERSION)
    env_rule = spaces_working_env()

    self_gnu_capsule_checkout(
        "autotools",
        "v2024",
        checkout_deps = [env_rule],
        prefix = "sysroot",
    )

    return env_rule

def gnu_capsule(repo, owner = None, domain = "ftp.gnu.org"):
    """
    Get the capsule descriptor for the GNU source

    Args:
        repo: The repository name
        owner: The owner of the repository
        domain: The domain of the repository (Default is ftp.gnu.org)
    """
    effective_owner = owner if owner else repo
    return capsule(domain, effective_owner, repo)

def gnu_capsule_add_checkout_and_run(
        name,
        capsule,
        version,
        oras_url = None,
        gh_deploy_repo = None,
        checkout_function = None,
        suffix = "tar.gz",
        configure_args = []):
    """
    Add the checkout and run if the install path does not exist

    Args:
        name: The name of the capsule
        capsule: The capsule descriptor
        version: The version of the repository
        oras_url: The ORAS URL to deploy the capsule
        gh_deploy_repo: The repository to deploy the capsule to
        checkout_function: The checkout function
        suffix: The suffix of the archive file (tar.gz, tar.xz, tar.bz2, zip)
        configure_args: The arguments to pass to the configure script
    """

    def build_function(name, install_path, args):
        checkout_function(install_path)

        gnu_add_configure_make_install_from_source(
            name,
            owner = args["owner"],
            repo = args["repo"],
            version = args["version"],
            install_path = install_path,
            configure_args = args["configure_args"],
        )

    capsule_add_checkout_and_run(
        name,
        capsule = capsule,
        version = version,
        oras_url = oras_url,
        gh_deploy_repo = gh_deploy_repo,
        suffix = suffix,
        build_function = build_function,
        build_function_args = {
            "owner": capsule["owner"],
            "repo": capsule["repo"],
            "version": version,
            "configure_args": configure_args,
        },
    )

def _checkout_function(_install_path):
    gnu_add_autotools_capsule()

def gnu_add_create_capsule(
        name,
        version,
        checkout_function = _checkout_function,
        configure_args = [],
        owner = None):
    """
    Add the GNU capsule

    Args:
        name: The name of the capsule
        version: The version of the repository
        checkout_function: The checkout function
        configure_args: The arguments to pass to the configure script
        owner: The owner of the repository
    """

    gnu_capsule_add_checkout_and_run(
        name,
        capsule = gnu_capsule(name, owner),
        oras_url = ORAS_URL,
        gh_deploy_repo = GH_DEPLOY_REPO,
        version = version,
        checkout_function = checkout_function,
        configure_args = configure_args,
    )
