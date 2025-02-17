"""
libyaml capsule
"""


load("//@star/capsules/star/capsules.star", CAPSULE = "GITHUB_COM_YAML_LIBYAML_V0")
load("//@star/capsules/star/cmake.star", "cmake_add_build_install_publish")
cmake_add_build_install_publish(CAPSULE)

