"""

libxml2 capsule


load("//@star/capsules/star/cmake.star", "cmake_add_build_install_publish")
load("//@star/capsules/star/capsules.star", 
    CAPSULE = "GITHUB_COM_GNOME_LIBXML_V2",
    "FTP_GNU_ORG_LIBICONV_V1")
cmake_add_build_install_publish(
    CAPSULE,
    capsule_deps = [FTP_GNU_ORG_LIBICONV_V1])

"""


