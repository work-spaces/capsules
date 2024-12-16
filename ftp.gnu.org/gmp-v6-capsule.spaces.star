"""

GNU capsule

"""

load("//@sdk/star/gnu.star", "gnu_capsule_add_checkout_and_run")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

gnu_add_autotools_capsule()

gnu_capsule_add_checkout_and_run(
    "gmp",
    oras_url = "ghrc.io/work-spaces",
    version = "6.3.0",
)

