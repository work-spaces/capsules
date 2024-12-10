"""

zstd capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/capsule.star", "capsule_add_checkout_and_run")


version = "1.5.5"
rev = "v{}".format(version)

def build_zstd(capsule_from_source, install_path):
    checkout_add_repo(
        capsule_from_source,
        url = "https://github.com/facebook/zstd",
        rev = rev,
        clone = "Blobless",
    )

    run_add_exec(
        "zstd_build",
        command = "make",
        args = ["-j{}".format(info.get_cpu_count())],
        working_directory = capsule_from_source,
    )

    run_add_exec(
        "zstd_install",
        command = "make",
        args = ["install"],
        working_directory = capsule_from_source,
        deps = ["zstd_build"],
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


