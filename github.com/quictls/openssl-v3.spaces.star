"""

OpenSSL capsule (quictls version)


load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load("//@star/sdk/star/capsule.star", "capsule", "capsule_add_checkout_and_run")
load("//@star/sdk/star/checkout.star", "checkout_add_repo")
load("//@star/packages/star/spaces-cli.star", "spaces_add")
load(
    "//@star/capsules/star/self.star",
    "GH_DEPLOY_REPO",
    "ORAS_URL",
    "SELF_SPACES_VERSION",
)
load("//@star/capsules/star/openssl.star", "openssl_build")

def build_function(name, install_path, _args):
    spaces_add("spaces0", SELF_SPACES_VERSION)

    checkout_add_repo(
        "quictls_openssl",
        url = "https://github.com/quictls/openssl",
        rev = "openssl-3.3.0-quic1",
        clone = "Blobless",
    )

    openssl_build(
        name,
        source_directory = "quictls_openssl",
        install_path = install_path,
    )

name = "openssl"
version = "2.5.19"
rev = "v{}".format(version)

capsule_add_checkout_and_run(
    name,
    capsule = capsule("github.com", "quictls", name),
    version = version,
    oras_url = ORAS_URL,
    gh_deploy_repo = GH_DEPLOY_REPO,
    build_function = build_function,
    build_function_args = {},
)

spaces_working_env()

"""
