"""

nghttp2 capsule

"""

load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load("//@star/sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@star/sdk/star/capsule.star", "capsule")
load("//@star/packages/star/spaces-cli.star", "spaces_add")
load("self.star", "ORAS_URL", "GH_DEPLOY_REPO")

def _checkout_function(_install_path):
    spaces_add("spaces0", "v0.11.4")
    cmake_add("cmake3", "v3.31.1")
    spaces_working_env()


def cmake_add_create_capsule(
    domain,
    owner,
    repo,
    version,
    rev = None,
    checkout_function = _checkout_function,
    configure_args = [],
    relative_source_directory = None,
    checkout_submodules = False):
    """
    Add the cmake capsule

    Args:
        domain: The domain of the repository
        owner: The owner of the repository
        repo: The repository name
        version: The version of the repository
        rev: The revision of the repository
        checkout_function: The checkout function
        configure_args: The arguments to pass to the configure script
        checkout_submodules: Checkout the submodules
        relative_source_directory: The relative source directory
    """

    effective_rev = rev if rev else "v{}".format(version)

    cmake_capsule_add_repo_checkout_and_run(
        repo,
        capsule = capsule(domain, owner, repo),
        rev = effective_rev,
        version = version,
        oras_url = ORAS_URL,
        gh_deploy_repo = GH_DEPLOY_REPO,
        checkout_function = checkout_function,
        checkout_submodules = checkout_submodules,
        relative_source_directory = relative_source_directory,
        configure_args = configure_args
    )

