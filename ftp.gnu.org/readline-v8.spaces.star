"""
GNU capsule
"""

load("//@star/capsules/star/gnu.star", "gnu_add_create_capsule")

gnu_add_create_capsule(
    "readline",
    version = "8.2",
    configure_args = ["--with-pic", "--enable-static"],
)
