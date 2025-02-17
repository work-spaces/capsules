"""

GNU capsule




load("//@star/capsules/star/capsules.star", CAPSULE = "FTP_GNU_ORG_NCURSES_V6")
load("//@star/capsules/star/gnu.star", "gnu_add_build_install_publish")

gnu_add_build_install_publish(
    CAPSULE,
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

"""

