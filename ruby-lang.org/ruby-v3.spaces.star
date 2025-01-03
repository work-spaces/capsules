"""

Ruby capsule

"""

load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load("//@star/sdk/star/capsule.star", "capsule", "capsule_add_checkout_and_run")
load("//@star/sdk/star/gnu.star", "gnu_add_configure_make_install")
load("//@star/sdk/star/run.star", "run_add_target")
load("//@star/packages/star/spaces-cli.star", "spaces_add")
load(
    "//@star/capsules/star/self.star",
    "GH_DEPLOY_REPO",
    "ORAS_URL",
    "self_gnu_capsule_checkout",
    "self_capsule_checkout"
)

def build_function(name, install_path, _args):
    """
    Builds ruby

    Args:
        name: name of the build rule used to build ruby
        install_path: path to install ruby
        _args: unused
    """
    spaces_add("spaces0", "v0.11.11")
    self_capsule_checkout(
        "github.com",
        "quictls",
        "openssl-v3"
    )
    self_capsule_checkout("github.com", "yaml", "libyaml-v0")
    self_gnu_capsule_checkout("readline-v8")
    self_gnu_capsule_checkout("gmp-v6")
    checkout_add_archive(
        "ruby-source",
        url = "https://cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.1.tar.gz",
        sha256 = "3d385e5d22d368b064c817a13ed8e3cc3f71a7705d7ed1bae78013c33aa7c87f",
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
        ]
    )
    rpath_update_macos_install_dir(
        "update_macos_rpaths",
        install_path,
        deps = ["build_ruby"],
    )
    run_add_target(name, deps = ["update_macos_rpaths"])
    


name = "ruby"
version = "3.4.1"
rev = "v{}".format(version)

capsule_add_checkout_and_run(
    name,
    capsule = capsule("ruby-lang.org", "ruby", name),
    version = version,
    oras_url = ORAS_URL,
    gh_deploy_repo = GH_DEPLOY_REPO,
    build_function = build_function,
    build_function_args = {},
)

spaces_working_env()