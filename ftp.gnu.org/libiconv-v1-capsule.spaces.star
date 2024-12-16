"""

GNU capsule

"""

load("//@sdk/star/gnu.star", "gnu_capsule_add_checkout_and_run")
load("//@sdk/star/capsule.star", "capsule_add", "capsule_get_prefix")
load("//gnu.star", "gnu_add_autotools_capsule")

checkout_capsules_rule_name = gnu_add_autotools_capsule()


prefix = capsule_get_prefix("libiconv")

#libiconv depends on gettext
capsule_checkout(
    "gettext",
    scripts = ["capsules/ftp.gnu.org/preload", "capsules/ftp.gnu.org/gettext-v0-capsule"],
    deps = [checkout_capsules_rule_name],
    prefix = prefix,
)

gnu_capsule_add_checkout_and_run(
    capsule_name = "libiconv",
    oras_url = "ghrc.io/work-spaces",
    version = "1.17",
    configure_args = [
        "--enable-static",
        "--without-libiconv-prefix",
        "--without-libintl-prefix",
        "--disable-nls",
        "--enable-extra-encodings"
    ]
)
