"""

GNU capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/gnu.star", "gnu_capsule_add_checkout_and_run")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

load("//@sdk/star/spaces-sdk.star", "spaces_add")
spaces_add("spaces0", "v0.11.4")

checkout_capsules_rule_name = gnu_add_autotools_capsule()

#libiconv depends on gettext
gettext0 = capsule_dependency("ftp.gnu.org", "gettext", "gettext", semver = "0")

prefix = capsule_get_prefix("libiconv")

capsule_add(
    "gettext_capsule",
    required = [gettext0],
    scripts = ["capsules/ftp.gnu.org/preload", "capsules/ftp.gnu.org/gettext-v0-capsule"],
    deps = [checkout_capsules_rule_name],
    prefix = prefix,
)


gnu_capsule_add_checkout_and_run(
    capsule_name = "readline",
    deploy_repo = "https://github.com/work-spaces/capsules",
    version = "8.2",
)

spaces_working_env()
