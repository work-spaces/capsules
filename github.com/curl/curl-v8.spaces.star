"""

curl capsule

"""

load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load("//@star/sdk/star/capsule.star", "capsule_add_checkout_and_run", "capsule")
load("//@star/sdk/star/gnu.star", "gnu_add_repo")
load("//@star/packages/star/spaces-cli.star", "spaces_add")
load("//@star/packages/star/package.star", "package_add")

def _gnu_capsule_checkout(name, prefix):
    capsule_checkout(
        name,
        scripts = [
            "capsules/ftp.gnu.org/lock",
            "capsules/ftp.gnu.org/preload",
            "capsules/ftp.gnu.org/{}".format(name),
        ],
        deps = [capsules_checkout_rule],
        prefix = prefix,
    )

def _capsule_checkout(domain, owner, name, prefix):
    capsule_checkout(
        name,
        scripts = [
            "capsules/lock",
            "capsules/preload",
            "capsules/{}/{}/{}".format(domain, owner, name),
        ],
        deps = [capsules_checkout_rule],
        prefix = prefix,
    )

def _build_function(name, install_path, _args):
    spaces_add("spaces0", "v0.11.4")

    capsules_checkout_rule = gnu_add_autotools_capsule()

    package_add("github.com", "xpack-dev-tools", "pkg-config-xpack", "v0.29.2-3")

    _gnu_capsule_checkout("libiconv-v1", "build/install")
    _gnu_capsule_checkout("libidn-v2", "build/install")
    _gnu_capsule_checkout("groff-v1", "build/install")
    _gnu_capsule_checkout("m4-v1", "build/install")
    _capsule_checkout("github.com", "nghttp2", "nghttp2-v1", "build/install")
    _capsule_checkout("github.com", "ngtcp2", "nghttp3-v1", "build/install")
    _capsule_checkout("github.com", "facebook", "zstd-v1", "build/install")
    _capsule_checkout("github.com", "madler", "zlib-v1", "build/install")
    _capsule_checkout("openldap.org", "openldap", "openldap-v1", "build/install")

    checkout_update_env(
        "update_build_env",
        vars = {
            "DYLD_FALLBACK_LIBRARY_PATH": "{}/lib".format(install_path),
            "LT_SYS_LIBRARY_PATH": "{}/lib".format(install_path),
            "PKG_CONFIG_PATH": "{}/lib/pkgconfig".format(install_path),
            "LDFLAGS": "-Wl,-rpath,{}/lib".format(install_path),
            "V": "1",
        },
        paths = ["{}/bin".format(install_path), "/usr/bin", "/bin"],
        )

    gnu_add_repo(
        "curl",
        deps = [
            "gnu_autotools_from_source",
            "openssl_install",
            "libxml2_install",
            "nghttp2_install",
            "brotli_install",
            "ngtcp2_install",
            "nghttp3_install",
            "zstd_install",
            "zlib_install",
            "libidn2_install",
            "openldap_install",
        ] + gnu_autotools_deps,
        autoreconf_args = ["-fi"],
        url = "https://github.com/curl/curl",
        rev = "curl-8_11_0",
        configure_args = [
            "--with-openssl={}".format(install_path),
            "--without-libpsl",
            "--with-nghttp2={}".format(install_path),
            "--with-nghttp3={}".format(install_path),
            "--with-ngtcp2={}".format(install_path),
            "--with-brotli={}".format(install_path),
            "--with-zstd={}".format(install_path),
            "--with-zlib={}".format(install_path),
            "--with-libidn2={}".format(install_path),
        ],
    )

name = "curl"
version = "8.11.1"
rev = "v{}".format(version)

capsule_add_checkout_and_run(
    name,
    capsule = capsule("github.com", "curl", "curl"),
    version = version,
    oras_url = "ghcr.io/work-spaces",
    gh_deploy_repo = "https://github.com/work-spaces/capsules",
    build_function = _build_function,
    build_function_args = {},
)

spaces_working_env()
