"""

OpenSSL capsule (quictls version)

"""

load("//@star/sdk/star/spaces-env.star", "spaces_working_env")
load(
    "//openssl.star",
    "openssl_build",
)

load("//@star/sdk/star/capsule.star", "capsule_add_checkout_and_run", "capsule")
load("//@star/sdk/star/checkout.star", "checkout_add_repo")
load("//@star/packages/star/spaces-cli.star", "spaces_add")

def build_function(name, install_path, _args):
    spaces_add("spaces0", "v0.11.4")

    checkout_add_repo(
        "quictls_openssl",
        url = "https://github.com/quictls/openssl",
        rev = "openssl-3.3.0-quic1",
        clone = "Blobless")

    openssl_build(
        "openssl_build",
        source_directory = "quictls_openssl",
        install_path = install_path,
    )

capsule_name = "openssl"
version = "2.5.19"
rev = "v{}".format(version)

capsule_add_checkout_and_run(
    name,
    capsule = capsule("github.com", "quictls", "openssl"),
    version = version,
    oras_url = "ghcr.io/work-spaces",
    gh_deploy_repo = "https://github.com/work-spaces/capsules",
    build_function = build_function,
    build_function_args = {},
)

spaces_working_env()
