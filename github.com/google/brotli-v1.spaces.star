"""
brotli capsule
"""

load("//@star/capsules/star/capsules.star", CAPSULE = "GITHUB_COM_GOOGLE_BROTLI_V1")
load("//@star/capsules/star/cmake.star", "cmake_add_build_install_publish")
cmake_add_build_install_publish(CAPSULE)


