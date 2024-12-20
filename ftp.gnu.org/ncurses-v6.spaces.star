"""

GNU capsule

"""

load("//@star/sources/star/gnu.star", "gnu_capsule_add_checkout_and_run")
load(
    "//gnu.star",
    "gnu_add_autotools_capsule",
)

gnu_add_autotools_capsule()

owner = "ncurses"

prefix = capsule_get_prefix("ncurses")

gnu_capsule_add_checkout_and_run(
    capsule_name = owner,
    oras_url = "ghcr.io/work-spaces",
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

