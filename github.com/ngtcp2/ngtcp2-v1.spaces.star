"""

ngtcp2 capsule




load(
    "//@star/capsules/star/capsules.star", 
    "GITHUB_COM_GOOGLE_BROTLI_V1",
    "GITHUB_COM_NGTCP2_NGHTTP3_V1",
    "GITHUB_COM_QUICTLS_OPENSSL_V2",
    CAPSULE = "GITHUB_COM_NGTCP2_NGTCP2_V1")
load("//@star/capsules/star/cmake.star", "cmake_add_build_install_publish")
cmake_add_build_install_publish(
    CAPSULE,
    checkout_submodules = True,
    capsule_deps = [
        GITHUB_COM_GOOGLE_BROTLI_V1,
        GITHUB_COM_NGTCP2_NGHTTP3_V1,
        GITHUB_COM_QUICTLS_OPENSSL_V2
    ])

"""