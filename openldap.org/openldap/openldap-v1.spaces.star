"""

Open LDAP capsule




load("//@star/capsules/star/capsules.star", 
    "FTP_GNU_ORG_GROFF_V1",
CAPSULE = "OPENLDAP_ORG_OPENLDAP_OPENLDAP_V1")
load("//@star/capsules/star/gnu.star", "gnu_add_repo_build_install_publish")
gnu_add_repo_build_install_publish(
    CAPSULE,
    capsule_deps = [FTP_GNU_ORG_GROFF_V1],
    rev = "OPENLDAP_REL_ENG_2_5_19")

"""