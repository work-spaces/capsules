"""

Autotools capsule workflow. This will install a copy of autotools in the capsules folder
in the spaces store.

"""

load(
    "//@star/sdk/star/spaces-env.star",
    "spaces_working_env",
)
load("//@star/sdk/star/capsule.star", "capsule_add_checkout_and_run")
load("//@star/sources/star/gnu.star", "gnu_add_autotools_from_source")
load("//@astar/capsules/star/gnu.star", "gnu_capsule")

capsule_name = "autotools"
autotools_capsule = gnu_capsule("autotools")
spaces_env_rule = spaces_working_env()


def _build_function(name, install_path, _args):
    autoconf_version = "2.72"
    automake_version = "1.17"
    libtool_version = "2.5.4"
    gnu_add_autotools_from_source(
        name,
        autoconf_version,
        automake_version,
        libtool_version,
        install_path = install_path,
    )

capsule_add_checkout_and_run(
    capsule_name,
    capsule = gnu_capsule(capsule_name),
    version = "2024.0.0",
    build_function = _build_function,
    build_function_args = {},
)
