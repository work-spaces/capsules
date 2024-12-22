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
    capsule_name = "groff",
    oras_url = "ghrc.io/work-spaces",
    gh_deploy_repo = "https://github.com/work-spaces/capsules",
    version = "1.23.0",
    checkout_function = _checkout_function,
)
