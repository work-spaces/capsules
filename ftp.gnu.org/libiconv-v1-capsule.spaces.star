"""

GNU capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/gnu.star", "gnu_capsule_add_checkout_and_run")
load("//gnu.star", "gnu_add_autotools_capsule")
load("//@sdk/star/spaces-sdk.star", "spaces_add")

spaces_add("spaces0", "v0.11.4")

gnu_add_autotools_capsule()

gnu_capsule_add_checkout_and_run(
    capsule_name = "libiconv",
    deploy_repo = "https://github.com/work-spaces/capsules",
    version = "1.17",
)

spaces_working_env()
