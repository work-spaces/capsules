"""

GNU capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/gnu.star", "gnu_capsule_add_checkout_and_run")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

gnu_add_autotools_capsule()

owner = "gettext"

gnu_capsule_add_checkout_and_run(
    capsule_name = owner,
    deploy_repo = "https://github.com/work-spaces/capsules",
    version = "0.22",
)

spaces_working_env()
