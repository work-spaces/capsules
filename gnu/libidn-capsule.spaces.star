"""

M4 capsule

"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load(
    "gnu.star",
    "gnu_add_autotools_capsule",
    "gnu_add_checkout_and_run",
)

gnu_add_autotools_capsule()

owner = "libidn"
repo = "libidn2"
version = "2.3.7"
capsule_name = "libidn2"

gnu_add_checkout_and_run(
    capsule_name,
    owner = owner,
    repo = repo,
    version = version,
)

spaces_working_env()
