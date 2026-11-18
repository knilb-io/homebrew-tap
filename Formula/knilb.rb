class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.13.1"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.13.1/knilb-macos-arm64.tar.gz"
      sha256 "253c7f84b2467ae4b2b698e50ece8ea63bdc34eefcb2c34328986d88ff11d459"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.13.1/knilb-macos-x86_64.tar.gz"
      sha256 "17158d6cdff35b298d24aa5fa829e7cc7523cc338445fb72ae3c8a96b42fd2ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.13.1/knilb-linux-arm64.tar.gz"
      sha256 "0ba2e86e34ed4e68e5c3128ef6734b215f71cb77e9197e88a4ac45232020f080"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.13.1/knilb-linux-x86_64.tar.gz"
      sha256 "b8538e10abd3dfc7e8c4efe6470020f59b0951e22aa06db995bb088e6faefb6c"
    end
  end

  def install
    # PyInstaller onedir bundle: the knilb binary and its sibling
    # _internal directory. Homebrew auto-strips the single top-level
    # knilb/ directory from the tarball before running this block,
    # so the cwd is already the bundle's contents.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"knilb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/knilb --version")
  end
end
