"""
Function to build OpenSSL
"""

load(
    "//@star/sdk/star/run.star",
    "run_add_exec",
    "run_add_target"
)

load("//@star/sdk/star/ws.star", "workspace_get_absolute_path")


def openssl_build(
        name,
        source_directory,
        install_path = [],
        configure_args = [],
        make_args = [],
        deps = []):
    """
    Build OpenSSL

    Args:
        name: The name of the project
        source_directory: The directory of the project
        install_path: The path to install the project
        configure_args: The arguments to pass to the configure script
        make_args: The arguments to pass to the build command
        deps: The dependencies of the project
    """

    prepare_rule_name = "{}_prepare".format(name)
    configure_rule_name = "{}_configure".format(name)
    build_rule_name = "{}_build".format(name)
    install_rule_name = "{}_install".format(name)
    build_directory = "build/{}".format(name)
    workspace = workspace_get_absolute_path()
    cpu_count = info.get_cpu_count()

    run_add_exec(
        prepare_rule_name,
        command = "mkdir",
        args = ["-p", build_directory],
    )

    run_add_exec(
        configure_rule_name,
        deps = deps + [prepare_rule_name],
        inputs = ["+{}/Configure".format(source_directory)],
        command = "{}/{}/Configure".format(workspace, source_directory),
        args = [
            "--prefix={}".format(install_path),
            "--openssldir={}/openssl".format(install_path),
            "-no-docs",
        ] + configure_args,
        working_directory = build_directory,
        help = "Build {}".format(name),
    )

    run_add_exec(
        build_rule_name,
        deps = [configure_rule_name],
        inputs = ["+{}/Makefile".format(build_directory), "+{}/**".format(source_directory)],
        command = "make",
        args = ["-j{}".format(cpu_count)] + make_args,
        working_directory = build_directory,
        help = "Build {}".format(name),
    )

    run_add_exec(
        install_rule_name,
        deps = [build_rule_name],
        inputs = ["+{}/**".format(build_directory)],
        command = "make",
        args = ["install"],
        working_directory = build_directory,
        help = "Install {}".format(name),
    )

    run_add_target(
        name,
        deps = [install_rule_name],
    )