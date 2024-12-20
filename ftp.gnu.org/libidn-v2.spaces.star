"""

GNU capsule

"""

load("//@sources/star/gnu.star", "gnu_capsule_add_checkout_and_run")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

gnu_add_autotools_capsule()

gnu_capsule_add_checkout_and_run(
    capsule_name = "libidn",
    oras_url = "ghcr.io/work-spaces",
    version = "2.3.7",
)
