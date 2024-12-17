"""

GNU capsule

"""

load("//@sdk/star/gnu.star", "gnu_capsule_add_checkout_and_run")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

gnu_add_autotools_capsule()

owner = "gettext"

gnu_capsule_add_checkout_and_run(
    capsule_name = owner,
    oras_url = "ghrc.io/work-spaces",
    version = "0.22",
    configure_args = [
        "--disable-csharp"
    ]
)
