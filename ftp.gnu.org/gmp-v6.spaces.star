"""

GNU capsule

"""

load("//@star/capsules/star/gnu.star", "gnu_add_create_capsule")

gnu_add_create_capsule(
    "gmp",
    version = "6.3.0",
    configure_args = ["--with-pic", "--enable-static"],
)
