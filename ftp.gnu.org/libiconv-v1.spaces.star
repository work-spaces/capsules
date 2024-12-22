"""

GNU capsule

"""

load("//@star/capsules/star/gnu.star", "gnu_add_autotools_capsule", "gnu_add_create_capsule")
load("//@star/capsules/star/self.star", "self_gnu_capsule_checkout")

def _checkout_function(install_path):
    gnu_add_autotools_capsule()

    self_gnu_capsule_checkout(
        "getttext-v0",
        prefix = install_path,
    )

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
    checkout_function = _checkout_function,
)
