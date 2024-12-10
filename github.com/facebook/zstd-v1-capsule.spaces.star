"""

zstd capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/capsule.star", "capsule_add_checkout_and_run")
load("//@sdk/star/run.star", "run_add_exec")
load("//@sdk/star/checkout.star", "checkout_add_repo")
load("//@sdk/star/spaces-sdk.star", "spaces_add")

spaces_add("spaces0", "v0.11.4")

version = "1.5.5"
rev = "v{}".format(version)


# Need to provide xz and lz4 as dependencies

def build_zstd(capsule_from_source, install_path, args):
    """
    Build zstd from source

    Args:
        capsule_from_source: capsule name
        install_path: install path
        args: arguments
    """
    checkout_rule = "{}_source".format(capsule_from_source)
    build_rule = "{}_build".format(capsule_from_source)
    checkout_add_repo(
        checkout_rule,
        url = "https://github.com/facebook/zstd",
        rev = args["rev"],
        clone = "Blobless",
    )

    run_add_exec(
        build_rule,
        command = "make",
        args = ["-j{}".format(info.get_cpu_count())],
        working_directory = checkout_rule,
    )

    # Building creates dependencies on system libraries xz and lz4 in /usr/local/opt

    # The install prefix baked into the zstd library is /usr/local/lib
    # but it needs to be the location in the spaces capsule in order to
    # be re-locatable
    run_add_exec(
        capsule_from_source,
        command = "make",
        args = ["install"],
        working_directory = checkout_rule,
        deps = [build_rule],
        env = {
            "PREFIX": install_path,
        },
    )

capsule_add_checkout_and_run(
    capsule_name = "zstd",
    domain = "github.com",
    owner = "facebook",
    repo = "zstd",
    version = version,
    deploy_repo = "https://github.com/work-spaces/capsules",
    build_function = build_zstd,
    build_function_args = {
        "rev": rev,
    },
)

spaces_working_env()
