"""

GNU capsule

"""

load("//@star/sources/star/gnu.star", "gnu_capsule_add_checkout_and_run", "gnu_capsule")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

def _checkout_function():
    gnu_add_autotools_capsule()

source = "m4"

gnu_capsule_add_checkout_and_run(
    source,
    capsule = gnu_capsule(source),
    oras_url = "ghcr.io/work-spaces",
    gh_deploy_repo = "https://github.com/work-spaces/capsules",
    version = "1.4.19",
    checkout_function = _checkout_function,
)

