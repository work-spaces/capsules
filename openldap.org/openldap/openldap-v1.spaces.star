"""

Open LDAP capsule

"""

load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load("//@star/sdk/star/capsule.star", "capsule_add_checkout_and_run", "capsule")
load("//@star/sdk/star/gnu.star", "gnu_add_repo")
load("//@star/packages/star/spaces-cli.star", "spaces_add")
load("//@star/capsules/star/self.star", "ORAS_URL", "GH_DEPLOY_REPO")

def build_function(name, install_path, _args):
    spaces_add("spaces0", "v0.11.4")
    gnu_add_repo(
        "openldap_add_repo_build",
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

spaces_working_env()
