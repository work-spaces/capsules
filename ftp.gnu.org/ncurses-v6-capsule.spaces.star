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

gnu_add_autotools_capsule()

owner = "ncurses"

prefix = capsule_get_prefix("ncurses")

gnu_capsule_add_checkout_and_run(
    capsule_name = owner,
    deploy_repo = "https://github.com/work-spaces/capsules",
    version = "6.5",
    configure_args = [
        "--enable-widec",
        "--disable-lib-suffixes",
        "--enable-overwrite",
        "--with-shared",
        "--with-cxx-shared",
        "--without-debug",
        "--without-ada",
        "--with-manpage-format=normal",
        "--without-pkg-config",
        "--enable-pc-files",
        '--with-pkg-config-libdir="{}/lib/pkgconfig"'.format(prefix),
        "--disable-mixed-case",
    ],
)

spaces_working_env()
