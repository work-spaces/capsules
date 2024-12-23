"""
GNU capsule
"""

load("//@star/capsules/star/gnu.star", "gnu_add_create_capsule")

gnu_add_create_capsule(
    "libiconv",
    version = "1.17",
    configure_args = [
        "--enable-static",
        "--without-libiconv-prefix",
        "--without-libintl-prefix",
        "--disable-nls",
        "--enable-extra-encodings",
    ],
)
