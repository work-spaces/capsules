"""

GNU capsule

"""

load("//@star/sources/star/gnu.star", "gnu_capsule_add_checkout_and_run")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

def _checkout_function():
    gnu_add_autotools_capsule()

gnu_capsule_add_checkout_and_run(
    capsule_name = "libidn",
    oras_url = "ghcr.io/work-spaces",
    version = "2.3.7",
    gh_deploy_repo = "https://github.com/work-spaces/capsules",
    checkout_function = _checkout_function,
)
