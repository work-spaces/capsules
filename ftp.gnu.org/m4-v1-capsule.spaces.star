"""

GNU capsule

"""

load("//@sdk/star/gnu.star", "gnu_capsule_add_checkout_and_run", "gnu_capsule")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

gnu_add_autotools_capsule()

source = "m4"

gnu_capsule_add_checkout_and_run(
    name = source,
    capsule = gnu_capsule(source),
    oras_url = "ghcr.io/work-spaces",
    version = "1.4.19",
)

