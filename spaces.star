"""
Capsules rules
"""

load("//@star/sdk/star/checkout.star", "checkout_add_soft_link_asset")
load("//@star/sdk/star/run.star", "run_add_target")
load("//@star/sdk/star/capsule.star", "capsule_get_run_name")
load(
    "//@star/sdk/star/ws.star",
    "workspace_get_absolute_path",
    "workspace_get_path_to_checkout",
)
load(
    "star/capsules.star",
    #"FTP_GNU_ORG_AUTOTOOLS_V2024",
    "FTP_GNU_ORG_GETTEXT_V0",
    "FTP_GNU_ORG_GMP_V6",
    "FTP_GNU_ORG_GROFF_V1",
    "FTP_GNU_ORG_LIBICONV_V1",
    "FTP_GNU_ORG_LIBIDN_V2",
    "FTP_GNU_ORG_M4_V1",
    "FTP_GNU_ORG_MPC_V1",
    "FTP_GNU_ORG_MPFR_V4",
    "FTP_GNU_ORG_NCURSES_V6",
    "FTP_GNU_ORG_READLINE_V8",
    #"GITHUB_COM_CURL_CURL_V8",
    "GITHUB_COM_FACEBOOK_ZSTD_V1",
    "GITHUB_COM_GNOME_LIBXML_V2",
    "GITHUB_COM_GOOGLE_BROTLI_V1",
    "GITHUB_COM_LZ4_LZ4_V1",
    "GITHUB_COM_MADLER_ZLIB_V1",
    "GITHUB_COM_NGHTTP2_NGHTTP2_V1",
    "GITHUB_COM_NGTCP2_NGHTTP3_V1",
    "GITHUB_COM_NGTCP2_NGTCP2_V1",
    "GITHUB_COM_QUICTLS_OPENSSL_V2",
    "GITHUB_COM_TUKAANI_PROJECT_XZ_V5",
    "GITHUB_COM_YAML_LIBYAML_V0",
    #"RUBY_LANG_ORG_RUBY_RUBY_V3",
)
load("star/cmake.star", "cmake_add_build_install_publish")
load("star/gnu.star", "gnu_add_build_install_publish")

WORKSPACE = workspace_get_absolute_path()
CHECKOUT_PATH = "{}/{}".format(WORKSPACE, workspace_get_path_to_checkout())

checkout_add_soft_link_asset(
    "star",
    source = "{}/star".format(CHECKOUT_PATH),
    destination = "@star/capsules/star",
)

gnu_add_build_install_publish(
    FTP_GNU_ORG_GETTEXT_V0,
    configure_args = [
        "--disable-csharp",
    ],
)

gnu_add_build_install_publish(
    FTP_GNU_ORG_GMP_V6,
    configure_args = ["--with-pic", "--enable-static"],
)

gnu_add_build_install_publish(FTP_GNU_ORG_GROFF_V1)
gnu_add_build_install_publish(
    FTP_GNU_ORG_LIBICONV_V1,
    configure_args = [
        "--enable-static",
        "--without-libiconv-prefix",
        "--without-libintl-prefix",
        "--disable-nls",
        "--enable-extra-encodings",
    ],
)
gnu_add_build_install_publish(FTP_GNU_ORG_LIBIDN_V2)
gnu_add_build_install_publish(FTP_GNU_ORG_M4_V1)
gnu_add_build_install_publish(
    FTP_GNU_ORG_MPC_V1,
)

gnu_add_build_install_publish(
    FTP_GNU_ORG_MPFR_V4,
)

gnu_add_build_install_publish(
    FTP_GNU_ORG_NCURSES_V6,
    configure_args = [
        "--enable-widec",
        "--disable-lib-suffixes",
        "--enable-overwrite",
        "--with-shared",
        "--with-cxx-shared",
        "--without-debug",
        "--without-ada",
        "--with-manpage-format=normal",
        "--without-pkg-config",
        "--enable-pc-files",
        "--disable-mixed-case",
    ],
)

gnu_add_build_install_publish(
    FTP_GNU_ORG_READLINE_V8,
    configure_args = ["--with-pic", "--enable-static"],
)

cmake_add_build_install_publish(
    GITHUB_COM_FACEBOOK_ZSTD_V1,
    relative_source_directory = "build/cmake",
    checkout_submodules = True,
)

cmake_add_build_install_publish(GITHUB_COM_GNOME_LIBXML_V2)

cmake_add_build_install_publish(GITHUB_COM_GOOGLE_BROTLI_V1)
cmake_add_build_install_publish(GITHUB_COM_LZ4_LZ4_V1)

cmake_add_build_install_publish(GITHUB_COM_MADLER_ZLIB_V1)

cmake_add_build_install_publish(
    GITHUB_COM_NGHTTP2_NGHTTP2_V1,
    checkout_submodules = True,
)

cmake_add_build_install_publish(
    GITHUB_COM_NGTCP2_NGHTTP3_V1,
    checkout_submodules = True,
)

cmake_add_build_install_publish(
    GITHUB_COM_NGTCP2_NGTCP2_V1,
    checkout_submodules = True,
)

run_add_target(
    capsule_get_run_name(GITHUB_COM_QUICTLS_OPENSSL_V2),
    deps = [],
)

cmake_add_build_install_publish(
    GITHUB_COM_TUKAANI_PROJECT_XZ_V5,
    configure_args = [
        "-DBUILD_SHARED_LIBS=ON",
    ],
)

cmake_add_build_install_publish(GITHUB_COM_YAML_LIBYAML_V0)

_IGNORE = """
gnu_add_repo_build_install_publish(
    OPENLDAP_ORG_OPENLDAP_OPENLDAP_V1,
    capsule_deps = [FTP_GNU_ORG_GROFF_V1],
    rev = "OPENLDAP_REL_ENG_2_5_19")
"""
