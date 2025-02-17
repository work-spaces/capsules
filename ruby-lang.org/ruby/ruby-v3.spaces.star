"""

Ruby capsule

"""

load("//@star/capsules/star/capsules.star", 
    "GITHUB_COM_QUICTLS_OPENSSL_V2",
    "GITHUB_COM_YAML_LIBYAML_V0",
    "GITHUB_COM_GNU_READLINE_V8",
    "GITHUB_COM_GNU_GMP_V6",
CAPSULE = "RUBY_LANG_ORG_RUBY_RUBY_V3")
load(
    "//@star/sdk/star/capsule.star",
    "capsule_checkout_add_repo",
    "capsule_publish",
    "capsule_get_run_name",
    "capsule_get_rule_name",
)

CAPSULE_DEPS = [
    GITHUB_COM_QUICTLS_OPENSSL_V2,
    GITHUB_COM_YAML_LIBYAML_V0,
    GITHUB_COM_GNU_READLINE_V8,
    GITHUB_COM_GNU_GMP_V6,
]
DEPS = [capsule_get_run_name(dep) for dep in CAPSULE_DEPS]
BUILD_RULE = capsule_get_rule_name(CAPSULE, "build")
capsule_checkout_add_repo(CAPSULE, BUILD_RULE)


capsule_globs = ["+**", "-bin/**"]

CHECKOUT_RULE_TYPE = capsule_get_checkout_type(CAPSULE, BUILD_RULE)


checkout_add_archive(
    "ruby-source",
    url = "https://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.1.tar.gz",
    sha256 = "3d385e5d22d368b064c817a13ed8e3cc3f71a7705d7ed1bae78013c33aa7c87f",
    type = CHECKOUT_RULE_TYPE,
)
checkout_update_env(
    "update_build_env",
    vars = {
        "DYLD_FALLBACK_LIBRARY_PATH": "{}/lib".format(install_path),
        "LD_LIBRARY_PATH": "{}/lib".format(install_path),
        "LT_SYS_LIBRARY_PATH": "{}/lib".format(install_path),
        "PKG_CONFIG_PATH": "{}/lib/pkgconfig".format(install_path),
        "LDFLAGS": "-Wl,-rpath,{}/lib".format(install_path),
    },
    paths = ["{}/bin".format(install_path)],
    type = CHECKOUT_RULE_TYPE,
)

gnu_add_configure_make_install(
    "build_ruby",
    source_directory = "ruby-3.4.1",
    configure_args = [
        "--enable-static",
        "--with-gmp-dir={}".format(install_path),
        "--with-libyaml-dir={}".format(install_path),
        "--with-openssl-dir={}".format(install_path),
        "--with-readline-dir={}".format(install_path),
    ],
    install_path = install_path,
)

rpath_update_macos_install_dir(
    "update_macos_rpaths",
    install_path,
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
        input_file = "{}/bin/{}".format(install_path, binary_name),
        new_shebang = "#!/usr/bin/env ruby",
        deps = ["update_macos_rpaths"],
    )
    shebangs_deps.append(SHEBANG_RULE)


capsule_publish(capsule, deps = [BUILD_RULE] + shebangs_deps)


