"""

lz4 capsule

"""

load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load("//@star/sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_repo_checkout_and_run")
load("//@star/packages/star/spaces-cli.star", "spaces_add")

def checkout_function():
    spaces_add("spaces0", "v0.11.4")
    cmake_add("cmake3", "v3.31.1")

version = "1.10.0"
rev = "v{}".format(version)

cmake_capsule_add_repo_checkout_and_run(
    capsule_name = "lz4",
    domain = "github.com",
    owner = "lz4",
    repo = "lz4",
    rev = rev,
    version = version,
    checkout_function = checkout_function,
    relative_source_directory = "build/cmake",
    oras_url = "ghcr.io/work-spaces",
)

spaces_working_env()
