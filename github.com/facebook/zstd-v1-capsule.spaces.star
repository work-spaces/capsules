"""

zstd capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/capsule.star", "capsule_add_checkout_and_run")
load("//@sdk/star/run.star", "run_add_exec", "run_add_target")


version = "1.5.5"
rev = "v{}".format(version)

def build_zstd(capsule_from_source, install_path):
    """
    Build zstd from source

    Args:
        capsule_from_source: capsule name
        install_path: install path
    """
    checkout_rule = "{}_source".format(capsule_from_source)
    build_rule = "{}_build".format(capsule_from_source)
    checkout_add_repo(
        capsule_from_source,
        url = "https://github.com/facebook/zstd",
        rev = rev,
        clone = "Blobless",
    )

    run_add_exec(
        build_rule,
        command = "make",
        args = ["-j{}".format(info.get_cpu_count())],
        working_directory = checkout_rule,
    )

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
    capsule_name = "zlib",
    domain = "github.com",
    owner = "facebook",
    repo = "zstd",
    rev = rev,
    version = version,
    deploy_repo = "https://github.com/work-spaces/capsules",
    build_function = build_zstd,
    build_function_args = None
)

spaces_working_env()


