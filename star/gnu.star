"""
Helper functions for GNU capsules
"""

load("//@star/sources/star/gnu.star", "gnu_add_configure_make_install_from_source")
load(
    "//@star/sdk/star/capsule.star",
    "capsule_get_checkout_type",
    "capsule_get_install_path",
    "capsule_get_owner",
    "capsule_get_repo",
    "capsule_get_run_name",
    "capsule_publish",
    "capsule_can_publish",
    "capsule_get_rule_name",
    "capsule_get_version",
    "capsule_get_deps"
)

def gnu_add_build_install_publish(
        capsule,
        capsule_deps = [],
        configure_args = [],
        make_args = []):
    """
    Add add rules to build and install a capsule using GNU autotools.

    Args:
        capsule: The capsule
        capsule_deps: The dependencies as a list of capsule dicts
        configure_args: The configure arguments
        make_args: The make arguments
    """
    DEPS = capsule_get_deps(capsule_deps)
    BUILD_RULE = capsule_get_rule_name(capsule, "build")
    CHECKOUT_RULE_TYPE = capsule_get_checkout_type(capsule, BUILD_RULE)
    gnu_add_configure_make_install_from_source(
        BUILD_RULE,
        owner = capsule_get_owner(capsule),
        repo = capsule_get_repo(capsule),
        version = capsule_get_version(capsule),
        install_path = capsule_get_install_path(capsule),
        configure_args = configure_args,
        make_args = make_args,
        checkout_rule_type = CHECKOUT_RULE_TYPE,
        deps = DEPS,
    )

    if capsule_can_publish(capsule):
        capsule_publish(capsule, deps = [BUILD_RULE])


def gnu_add_repo_build_install_publish(
        capsule,
        rev = None,
        capsule_deps = [],
        configure_args = [],
        make_args = []):
    """
    Add add rules to build and install a capsule using GNU autotools.

    Args:
        capsule: The capsule
        capsule_deps: The dependencies as a list of capsule dicts
        configure_args: The configure arguments
        make_args: The make arguments
    """
    DEPS = [capsule_get_run_name(dep) for dep in capsule_deps]
    BUILD_RULE = capsule_get_rule_name(capsule, "build")


    capsule_publish(capsule, deps = [BUILD_RULE])



def gnu_add_autotools_capsule(capsule):
    """
    Add the autotools capsule

    Returns:
        The environment rule
    """

    gnu_add_configure_make_install_from_source(
        "build",
        owner = capsule_get_owner(capsule),
        repo = capsule_get_repo(capsule),
        version = capsule_get_version(capsule),
        install_path = capsule_get_install_path(capsule),
    )



