"""

GNU capsule

"""

load("//@star/capsules/star/gnu.star", "gnu_add_create_capsule")
gnu_add_create_capsule(
    "ncurses",
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
        "--disable-mixed-case",
    ],
)


