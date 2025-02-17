"""

xz capsule

"""

load("//@star/capsules/star/capsules.star", CAPSULE = "GITHUB_COM_TUKAANI_PROJECT_XZ_V5")
load("//@star/capsules/star/cmake.star", "cmake_add_build_install_publish")

cmake_add_build_install_publish(
    CAPSULE,
    configure_args = [
        "-DBUILD_SHARED_LIBS=ON",
    ],
)
