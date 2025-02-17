"""

"""

load(
    "//@star/sdk/star/capsule.star",
    "capsule_declare",
)

ORAS_URL = "ghcr.io/work-spaces"
GH_DEPLOY_REPO = "https://github.com/work-spaces/capsules"

def _declare_capsule(domain, owner, repo, version, rev = None):
    return capsule_declare(
        domain = domain,
        owner = owner,
        repo = repo,
        version = version,
        rev = rev,
        oras_url = ORAS_URL,
        gh_deploy_repo = GH_DEPLOY_REPO,
    )

def _declare_github_capsule(owner, repo, version, rev = None):
    return capsule_declare(
        domain = "github.com",
        owner = owner,
        repo = repo,
        version = version,
        rev = rev,
        oras_url = ORAS_URL,
        gh_deploy_repo = GH_DEPLOY_REPO,
    )

def _declare_gnu_capsule(
        repo,
        version,
        rev = None,
        owner = None,
        domain = "ftp.gnu.org",
        oras_url = ORAS_URL,
        gh_deploy_repo = GH_DEPLOY_REPO):
    EFFECTIVE_OWNER = owner if owner != None else repo
    return capsule_declare(
        domain = domain,
        owner = EFFECTIVE_OWNER,
        source_directory = "{}/{}-{}".format(domain, repo, version),
        repo = repo,
        version = version,
        rev = rev,
        oras_url = oras_url,
        gh_deploy_repo = gh_deploy_repo,
    )

FTP_GNU_ORG_AUTOTOOLS_V2024 = _declare_gnu_capsule("autotools", "2024", oras_url = None, gh_deploy_repo = None)
FTP_GNU_ORG_GETTEXT_V0 = _declare_gnu_capsule("gettext", "0.22")
FTP_GNU_ORG_GMP_V6 = _declare_gnu_capsule("gmp", "6.3.0")
FTP_GNU_ORG_GROFF_V1 = _declare_gnu_capsule("groff", "1.23.0")
FTP_GNU_ORG_LIBICONV_V1 = _declare_gnu_capsule("libiconv", "1.17")
FTP_GNU_ORG_LIBIDN_V2 = _declare_gnu_capsule("libidn2", "2.3.7", owner = "libidn")
FTP_GNU_ORG_M4_V1 = _declare_gnu_capsule("m4", "1.4.19")
FTP_GNU_ORG_MPC_V1 = _declare_gnu_capsule("mpc", "1.3.1")
FTP_GNU_ORG_MPFR_V4 = _declare_gnu_capsule("mpfr", "4.2.1")
FTP_GNU_ORG_NCURSES_V6 = _declare_gnu_capsule("ncurses", "6.5")
FTP_GNU_ORG_READLINE_V8 = _declare_gnu_capsule("readline", "8.2")

GITHUB_COM_CURL_CURL_V8 = _declare_github_capsule("curl", "curl", "8.11.1")
GITHUB_COM_FACEBOOK_ZSTD_V1 = _declare_github_capsule("facebook", "zstd", "1.5.5")
GITHUB_COM_GNOME_LIBXML_V2 = _declare_github_capsule("gnome", "libxml2", "2.13.5")
GITHUB_COM_GOOGLE_BROTLI_V1 = _declare_github_capsule("google", "brotli", "1.1.0")
GITHUB_COM_LZ4_LZ4_V1 = _declare_github_capsule("lz4", "lz4", "1.10.0")
GITHUB_COM_MADLER_ZLIB_V1 = _declare_github_capsule("madler", "zlib", "1.3.1")
GITHUB_COM_NGHTTP2_NGHTTP2_V1 = _declare_github_capsule("nghttp2", "nghttp2", "1.64.0")
GITHUB_COM_NGTCP2_NGHTTP3_V1 = _declare_github_capsule("ngtcp2", "nghttp3", "1.6.0")
GITHUB_COM_NGTCP2_NGTCP2_V1 = _declare_github_capsule("ngtcp2", "ngtcp2", "1.9.1")
GITHUB_COM_QUICTLS_OPENSSL_V2 = _declare_github_capsule("quictls", "openssl", "2.5.19")
GITHUB_COM_TUKAANI_PROJECT_XZ_V5 = _declare_github_capsule("tukaani-project", "xz", "5.6.3")
GITHUB_COM_YAML_LIBYAML_V0 = _declare_github_capsule("yaml", "libyaml", "0.2.5", rev = "0.2.5")

OPENLDAP_ORG_OPENLDAP_OPENLDAP_V1 = _declare_capsule("openldap.org", "openldap", "openldap", "0.2.5")
RUBY_LANG_ORG_RUBY_RUBY_V3 = _declare_capsule("ruby-land.org", "ruby", "ruby", "3.4.1")
