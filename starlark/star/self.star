"""
Functions to using 
"""

load(
    "//@star/sdk/star/capsule.star",
    "capsule_checkout",
    "capsule"
)

ORAS_URL = "ghcr.io/work-spaces"
GH_DEPLOY_REPO = "https://github.com/work-spaces/capsules"

def self_gnu_capsule_checkout(name, prefix, checkout_deps = [], globs = None):
    capsule_checkout(
        name,
        scripts = [
            "capsules/lock",
            "capsules/preload",
            "capsules/ftp.gnu.org/{}".format(name),
        ],
        descriptor = capsule("ftp.gnu.org", name, name),
        deps = checkout_deps,
        prefix = prefix,
        globs = globs,
    )

def self_capsule_checkout(domain, owner, name, prefix, checkout_deps = [], globs = None):
    capsule_checkout(
        name,
        scripts = [
            "capsules/lock",
            "capsules/preload",
            "capsules/{}/{}/{}".format(domain, owner, name),
        ],
        descriptor = capsule(domain, owner, name),
        deps = checkout_deps,
        prefix = prefix,
        globs = globs,
    )
