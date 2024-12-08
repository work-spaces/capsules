"""

GNU capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/gnu.star", "gnu_capsule_add_checkout_and_run")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)
load(
    "//@sdk/star/gh.star",
    "gh_add",
)

gh_add(
    "gh2",
    version = "v2.62.0",
)

gnu_add_autotools_capsule()

gnu_capsule_add_checkout_and_run(
    capsule_name = "libiconv",
    deploy_repo = "https://github.com/work-spaces/capsules",
    version = "1.9.2",
)

spaces_working_env()
