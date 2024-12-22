"""

GNU capsule

"""

load("//@star/capsules/star/gnu.star", "gnu_add_create_capsule", "gnu_add_autotools_capsule")
load("//@star/capsules/star/self.star", "self_gnu_capsule_checkout")

def _checkout_function(install_path):
    capsules_checkout_rule = gnu_add_autotools_capsule()
    
    self_gnu_capsule_checkout(
        "gmp-v6",
        prefix = install_path,
        checkout_deps = [capsules_checkout_rule],
    )

gnu_add_create_capsule("mpfr", "4.2.1", checkout_function = _checkout_function)
