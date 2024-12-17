"""

GNU capsule

"""

load("//@sdk/star/gnu.star", "gnu_capsule_add_checkout_and_run", "gnu_capsule")
load(
    "//@sdk/star/capsule.star",
    "capsule_checkout",
)
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

capsules_checkout_rule = gnu_add_autotools_capsule()

source = "mpfr"

capsule_checkout(
    "gmp",
    scripts = [
        "capsules/lock",
        "capsules/ftp.gnu.org/preload",
        "capsules/ftp.gnu.org/gmp-v6",
    ],
    deps = [capsules_checkout_rule],
    prefix = "build/install",
)

gnu_capsule_add_checkout_and_run(
    source,
    capsule = gnu_capsule(source),
    oras_url = "ghcr.io/work-spaces",
    gh_deploy_repo = "https://github.com/work-spaces/capsules",
    version = "4.2.1",
)

