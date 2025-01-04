# capsules

The capsules repo is a collection of spaces capsule build rules. It builds and publishes spaces capsules as packages on github.

You can use these pre-built packages in your workspace using:

```python
load("//@star/sdk/star/oras.star", "oras_add_platform_archive")

oras_add_platform_archive(
    "ruby-v3",                            # This is the build rule name, can be anything
    url = "ghcr.io/work-spaces",          # Use ghcr.io/<github organization name>
    artifact = "ruby-lang.org-ruby-ruby", # package artifact (without the `-platform`)
    tag = "3.4.1-66a9004f"                # package tag
)
```