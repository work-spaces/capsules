"""

nghttp3 capsule

"""

load("//@star/capsules/star/capsules.star", CAPSULE = "GITHUB_COM_NGTCP2_NGHTTP3_V1")
load("//@star/capsules/star/cmake.star", "cmake_add_build_install_publish")
cmake_add_build_install_publish(
    CAPSULE,
    checkout_submodules = True)

