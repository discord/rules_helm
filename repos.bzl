load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def helm_repositories():
    skylib_version = "0.8.0"
    http_archive(
        name = "bazel_skylib",
        type = "tar.gz",
        url = "https://github.com/bazelbuild/bazel-skylib/releases/download/{}/bazel-skylib.{}.tar.gz".format(skylib_version, skylib_version),
        sha256 = "2ef429f5d7ce7111263289644d233707dba35e39696377ebab8b0bc701f7818e",
    )

    http_archive(
        name = "helm",
        sha256 = "538f85b4b73ac6160b30fd0ab4b510441aa3fa326593466e8bf7084a9c288420",
        urls = ["https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz"],
        build_file = "@com_github_tmc_rules_helm//:helm.BUILD",
    )

    http_archive(
        name = "helm_osx",
        sha256 = "71d213d63e1b727d6640c4420aee769316f0a93168b96073d166edcd3a425b3d",
        urls = ["https://get.helm.sh/helm-v3.4.1-darwin-amd64.tar.gz"],
        build_file = "@com_github_tmc_rules_helm//:helm.BUILD",
    )

    new_git_repository(
        name = "helm_tiller",
        remote = "https://github.com/rimusz/helm-tiller",
        commit = "0305b56f535b7dc3c8e9aa640a7a4732c9200e42",
        shallow_since = "1573742255 +0000",
        build_file = "@com_github_tmc_rules_helm//:helm.BUILD",
    )
