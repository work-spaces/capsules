"""
GNU capsule
"""

load("//@star/capsules/star/gnu.star", "gnu_add_create_capsule")

def _checkout_function(install_path):
    gnu_add_autotools_capsule()

    self_gnu_capsule_checkout(
        "ncurses-v6",
        prefix = install_path,
    )

gnu_add_create_capsule(
    "readline",
    version = "8.2",
    checkout_function = _checkout_function,
    configure_args = ["--with-pic", "--enable-static"],
)
