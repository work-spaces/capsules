"""

GNU capsule

"""

load("//@star/capsules/star/gnu.star", "gnu_add_autotools_capsule", "gnu_add_create_capsule")
load("//@star/capsules/star/self.star", "self_gnu_capsule_checkout")

def _checkout_function(install_path):
    gnu_add_autotools_capsule()

    self_gnu_capsule_checkout(
        "gmp-v6",
        prefix = install_path,
    )

    self_gnu_capsule_checkout(
        "mpfr-v4",
        prefix = install_path,
    )

gnu_add_create_capsule("mpc", "1.3.1", checkout_function = _checkout_function)
