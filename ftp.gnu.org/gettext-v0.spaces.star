"""
GNU capsule
"""


load("//@star/capsules/star/gnu.star", "gnu_add_create_capsule")

gnu_add_create_capsule(
    "gettext",
    "0.22",
    configure_args = [
        "--disable-csharp",
    ],
)
