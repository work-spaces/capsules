"""

GNU capsule


load(
    "//@star/capsules/star/capsules.star",
    "FTP_GNU_ORG_GMP_V6",
    "FTP_GNU_ORG_MPFR_V4",
    CAPSULE = "FTP_GNU_ORG_M4_V1",
)
load("//@star/capsules/star/gnu.star", "gnu_add_build_install_publish")

gnu_add_build_install_publish(
    CAPSULE,
    capsule_deps = [
        FTP_GNU_ORG_GMP_V6,
        FTP_GNU_ORG_MPFR_V4,
    ],
)
"""
