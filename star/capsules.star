"""

"""

load(
    "//@star/sdk/star/capsule.star",
    "capsule_declare",
)


ORAS_URL = "ghcr.io/work-spaces"
GH_DEPLOY_REPO = "https://github.com/work-spaces/capsules"

GITHUB_COM_MADLER_ZLIB_V1 = capsule_declare(
    domain = "github.com", 
    owner = "madler", 
    repo = "zlib",
    version = "1.3.1",
    oras_url = ORAS_URL,
    gh_deploy_repo = GH_DEPLOY_REPO)