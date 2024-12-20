"""

GNU capsule

"""

load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load("//@star/sdk/star/gnu.star", "gnu_capsule_add_checkout_and_run")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

load("//@star/packages/star/spaces-cli.star", "spaces_add")
spaces_add("spaces0", "v0.11.4")

gnu_add_autotools_capsule()

owner = "gettext"

gnu_capsule_add_checkout_and_run(
    capsule_name = owner,
    oras_url = "ghcr.io/work-spaces",
    version = "0.22",
)


spaces_working_env()
