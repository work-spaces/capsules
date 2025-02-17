"""

GNU capsule

"""


load("//@star/capsules/star/capsules.star", CAPSULE = "FTP_GNU_ORG_READLINE_V8")
load("//@star/capsules/star/gnu.star", "gnu_add_build_install_publish")

gnu_add_build_install_publish(
    CAPSULE,
    configure_args = ["--with-pic", "--enable-static"],
)
