"""

GNU capsule

"""

load("//@star/sdk/star/capsule.star", "capsule_add", "capsule_get_prefix")
load("//@star/sdk/star/gnu.star", "gnu_capsule_add_checkout_and_run")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

checkout_capsules_rule_name = gnu_add_autotools_capsule()


prefix = capsule_get_prefix("readline")

#readline depends on gettext
capsule_checkout(
    "gettext",
    scripts = ["capsules/ftp.gnu.org/preload", "capsules/ftp.gnu.org/gettext-v0"],
    deps = [checkout_capsules_rule_name],
    prefix = prefix,
)

gnu_capsule_add_checkout_and_run(
    capsule_name = "readline",
    oras_url = "ghcr.io/work-spaces",
    version = "8.2",
)
