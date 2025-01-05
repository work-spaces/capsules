"""

Open LDAP capsule

"""

load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load("//@star/sdk/star/capsule.star", "capsule", "capsule_add_checkout_and_run")
load("//@star/sdk/star/gnu.star", "gnu_add_repo")
load("//@star/packages/star/spaces-cli.star", "spaces_add")
load(
    "//@star/capsules/star/self.star",
    "GH_DEPLOY_REPO",
    "ORAS_URL",
    "self_gnu_capsule_checkout",
)

def build_function(name, install_path, _args):
    spaces_add("spaces0", "v0.11.11")
    env_rule = spaces_working_env()

    self_gnu_capsule_checkout(
        "groff",
        "v1",
        "sysroot",
        checkout_deps = [env_rule],
    )

    gnu_add_repo(
        name,
        url = "https://git.openldap.org/openldap/openldap",
        rev = "OPENLDAP_REL_ENG_2_5_19",
        install_path = install_path,
    )

name = "openldap"
version = "2.5.19"
rev = "v{}".format(version)

capsule_add_checkout_and_run(
    name,
    capsule = capsule("openldap.org", "openldap", name),
    version = version,
    oras_url = ORAS_URL,
    gh_deploy_repo = GH_DEPLOY_REPO,
    build_function = build_function,
    build_function_args = {},
)
