"""
xz capsule
"""

load("//@sdk/star/spaces-env.star", "spaces_working_env")
load("//@sdk/star/cmake.star", "cmake_add", "cmake_capsule_add_archive_checkout_and_run")
load("//@sdk/star/spaces-sdk.star", "spaces_add")

spaces_add("spaces0", "v0.11.4")
cmake_add("cmake3", "v3.31.1")

version = "5.6.3"
sha256 = "db0590629b6f0fa36e74aea5f9731dc6f8df068ce7b7bafa45301832a5eebc3a"

cmake_capsule_add_archive_checkout_and_run(
    capsule_name = "xz",
    domain = "sourceforge.net",
    owner = "lzmautils",
    repo = "xz",
    url = "https://sourceforge.net/projects/lzmautils/files/xz-{}.tar.xz/download".format(version),
    sha256 = sha256,
    filename = "xz-{}.tar.xz".format(version),
    version = version,
    source_directory = "xz-{}".format(version),
    oras_url = "ghcr.io/work-spaces",
    configure_args = [
        "-DBUILD_SHARED_LIBS=ON",
    ]
)

spaces_working_env()

