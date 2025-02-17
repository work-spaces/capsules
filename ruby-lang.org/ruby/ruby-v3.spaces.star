"""

Ruby capsule



load("//@star/capsules/star/capsules.star", 
    "GITHUB_COM_QUICTLS_OPENSSL_V2",
    "GITHUB_COM_YAML_LIBYAML_V0",
    "FTP_GNU_ORG_READLINE_V8",
    "FTP_GNU_ORG_GMP_V6",
CAPSULE = "RUBY_LANG_ORG_RUBY_RUBY_V3")

load("//@star/sdk/star/checkout.star", 
    "checkout_add_archive",
    "checkout_update_env")
load("//@star/sdk/star/gnu.star", "gnu_add_configure_make_install")
load("//@star/sdk/star/rpath.star", "rpath_update_macos_install_dir")
load("//@star/sdk/star/shebang.star", "shebang_add_update")
load(
    "//@star/sdk/star/capsule.star",
    "capsule_checkout_add_repo",
    "capsule_publish",
    "capsule_get_run_name",
    "capsule_get_rule_name",
    "capsule_get_checkout_type",
    "capsule_get_install_path"
)

CAPSULE_DEPS = [
    GITHUB_COM_QUICTLS_OPENSSL_V2,
    GITHUB_COM_YAML_LIBYAML_V0,
    FTP_GNU_ORG_READLINE_V8,
    FTP_GNU_ORG_GMP_V6,
]
DEPS = [capsule_get_run_name(dep) for dep in CAPSULE_DEPS]
BUILD_RULE = "build_ruby"
CHECKOUT_RULE_TYPE = capsule_get_checkout_type(CAPSULE, BUILD_RULE)
INSTALL_PATH = capsule_get_install_path(CAPSULE)

checkout_add_archive(
    "ruby-source",
    url = "https://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.1.tar.gz",
    sha256 = "3d385e5d22d368b064c817a13ed8e3cc3f71a7705d7ed1bae78013c33aa7c87f",
    type = CHECKOUT_RULE_TYPE,
)
checkout_update_env(
    "update_build_env",
    vars = {
        "DYLD_FALLBACK_LIBRARY_PATH": "{}/lib".format(INSTALL_PATH),
        "LD_LIBRARY_PATH": "{}/lib".format(INSTALL_PATH),
        "LT_SYS_LIBRARY_PATH": "{}/lib".format(INSTALL_PATH),
        "PKG_CONFIG_PATH": "{}/lib/pkgconfig".format(INSTALL_PATH),
        "LDFLAGS": "-Wl,-rpath,{}/lib".format(INSTALL_PATH),
    },
    paths = ["{}/bin".format(INSTALL_PATH)],
    type = CHECKOUT_RULE_TYPE,
)

gnu_add_configure_make_install(
    BUILD_RULE,
    source_directory = "ruby-3.4.1",
    configure_args = [
        "--enable-static",
        "--with-gmp-dir={}".format(INSTALL_PATH),
        "--with-libyaml-dir={}".format(INSTALL_PATH),
        "--with-openssl-dir={}".format(INSTALL_PATH),
        "--with-readline-dir={}".format(INSTALL_PATH),
    ],
    install_path = INSTALL_PATH,
)

rpath_update_macos_install_dir(
    "update_macos_rpaths",
    INSTALL_PATH,
    deps = ["build_ruby"],
)

shebangs_deps = []

binaries = [
    "bundle",
    "bundler",
    "erb",
    "gem",
    "irb",
    "racc",
    "rake",
    "rbs",
    "rdbg",
    "rdoc",
    "ri",
    "syntax_suggest",
    "typeprof",
]
for binary_name in binaries:
    SHEBANG_RULE = "update_{}_shebang".format(binary_name)
    shebang_add_update(
        "update_{}_shebang".format(binary_name),
        input_file = "{}/bin/{}".format(INSTALL_PATH, binary_name),
        new_shebang = "#!/usr/bin/env ruby",
        deps = ["update_macos_rpaths"],
    )
    shebangs_deps.append(SHEBANG_RULE)


capsule_publish(CAPSULE, deps = [BUILD_RULE] + shebangs_deps)

"""


