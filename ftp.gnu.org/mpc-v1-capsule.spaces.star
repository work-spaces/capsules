"""

GNU capsule

"""

load("//@sdk/star/gnu.star", "gnu_capsule_add_checkout_and_run", "gnu_capsule")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

gnu_add_autotools_capsule()

capsule_checkout(
    "gmp",
    scripts = [
        "capsules/ftp.gnu.org/preload",
        "capsules/ftp.gnu.org/gmp-v6-capsule",
    ],
    deps = ["@capsules/capsules"],
    prefix = "build/install",
)

capsule_checkout(
    "mpfr",
    scripts = [
        "capsules/ftp.gnu.org/preload",
        "capsules/ftp.gnu.org/mpfr-v4-capsule",
    ],
    deps = ["@capsules/capsules"],
    prefix = "build/install",
)

source = "mpc"
gnu_capsule_add_checkout_and_run(
    name = source,
    capsule = gnu_capsule(source),
    oras_url = "ghcr.io/work-spaces",
    version = "1.3.1",
)

