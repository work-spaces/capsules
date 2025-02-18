"""

CMake helpers

"""

load("//@star/sdk/star/cmake.star", "cmake_add_configure_build_install")
load("//@star/sdk/star/checkout.star", "CHECKOUT_TYPE_OPTIONAL")
load("//@star/sdk/star/run.star", "run_add_exec")
load(
    "//@star/sdk/star/capsule.star",
    "capsule_checkout_add_repo",
    "capsule_publish",
    "capsule_get_workspace_path",
    "capsule_get_install_path",
    "capsule_get_rule_name",
    "capsule_can_publish",
    "capsule_get_deps",
    "capsule_get_prefix_paths",
    "capsule_get_build_path"
)

def cmake_add_build_install_publish(
    capsule,
    configure_args = [],
    build_args = [],
    relative_source_directory = None,
    checkout_submodules = False):
    """
    Add add rules to build and install a capsule using CMake.

    The source code checkout will be skipped if the binary release is available.

    Args:
        capsule: The capsule name
        configure_args: The configure arguments
        build_args: The build arguments
        relative_source_directory: The relative source directory
        checkout_submodules: Whether to checkout submodules
    """
    DEPS = capsule_get_deps(capsule)
    BUILD_RULE = capsule_get_rule_name(capsule, "cmake")
    CHECKOUT_RULE_TYPE = capsule_checkout_add_repo(capsule, BUILD_RULE)
    WORKSPACE_SOURCE_DIRECTORY = capsule_get_workspace_path(capsule)
    EFFECTIVE_SOURCE_DIRECTORY = WORKSPACE_SOURCE_DIRECTORY if relative_source_directory == None else "{}/{}".format(WORKSPACE_SOURCE_DIRECTORY, relative_source_directory)
    PREFIX_PATHS = capsule_get_prefix_paths(capsule)
    SUBMODULE_RULE = "{}_submodules".format(BUILD_RULE)
    SUBMODULE_DEPS = []
    if checkout_submodules:
        run_add_exec(
            SUBMODULE_RULE,
            command = "git",
            args = ["submodule", "update", "--init", "--recursive"],
            working_directory = EFFECTIVE_SOURCE_DIRECTORY,
        )
        SUBMODULE_DEPS = [SUBMODULE_RULE]

    if CHECKOUT_RULE_TYPE != CHECKOUT_TYPE_OPTIONAL:
        cmake_add_configure_build_install(
            BUILD_RULE,
            source_directory = EFFECTIVE_SOURCE_DIRECTORY,
            build_directory = capsule_get_build_path(capsule),
            prefix_paths = PREFIX_PATHS,
            configure_args = configure_args,
            build_args = build_args,
            install_path = capsule_get_install_path(capsule),
            deps = DEPS + SUBMODULE_DEPS,
        )
        if capsule_can_publish(capsule):
            capsule_publish(capsule, deps = [BUILD_RULE])





