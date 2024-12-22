"""

GNU capsule

"""

load("//@star/sources/star/gnu.star", "gnu_capsule_add_checkout_and_run", "gnu_capsule")
load(
    "//@star/sdk/star/capsule.star",
    "capsule_checkout",
)
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)


def _checkout_function():
    capsules_checkout_rule = gnu_add_autotools_capsule()
    capsule_checkout(
        "gmp",
        scripts = [
            "capsules/ftp.gnu.org/lock",
            "capsules/ftp.gnu.org/preload",
            "capsules/ftp.gnu.org/gmp-v6",
        ],
        deps = [capsules_checkout_rule],
        prefix = "build/install",
    )

    capsule_checkout(
        "mpfr",
        scripts = [
            "capsules/ftp.gnu.org/lock",
            "capsules/ftp.gnu.org/preload",
            "capsules/ftp.gnu.org/mpfr-v4",
        ],
        deps = [capsules_checkout_rule],
        prefix = "build/install",
    )

source = "mpc"
gnu_capsule_add_checkout_and_run(
    source,
    capsule = gnu_capsule(source),
    oras_url = "ghcr.io/work-spaces",
    gh_deploy_repo = "https://github.com/work-spaces/capsules",
    version = "1.3.1",
    checkout_function = _checkout_function,
)

