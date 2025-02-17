"""

GNU capsule

"""

load("//@star/capsules/star/capsules.star", CAPSULE = "FTP_GNU_ORG_GROFF_V1")
load("//@star/capsules/star/gnu.star", "gnu_add_build_install_publish", "gnu_add_create_capsule")

gnu_add_build_install_publish(CAPSULE)