"""
Functions to using 
"""

load(
    "//@star/sdk/star/capsule.star",
    "capsule_checkout"
)

def self_gnu_capsule_checkout(name, prefix, checkout_deps = []):
    capsule_checkout(
        name,
        scripts = [
            "capsules/ftp.gnu.org/lock",
            "capsules/preload",
            "capsules/ftp.gnu.org/gnu-preload",
            "capsules/ftp.gnu.org/{}".format(name),
        ],
        deps = checkout_deps,
        prefix = prefix,
    )

def self_capsule_checkout(domain, owner, name, prefix, checkout_deps = []):
    capsule_checkout(
        name,
        scripts = [
            "capsules/lock",
            "capsules/preload",
            "capsules/{}/{}/{}".format(domain, owner, name),
        ],
        deps = checkout_deps,
        prefix = prefix,
    )