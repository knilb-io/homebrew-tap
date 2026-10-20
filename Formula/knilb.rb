class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.11.0"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.11.0/knilb-macos-arm64.tar.gz"
      sha256 "74088595f1fa53680b5893861f10f28ee769c44f09f311237c42ab1e3179d772"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.11.0/knilb-macos-x86_64.tar.gz"
      sha256 "a6c27d3568d80e2163bfdbe3ed40aa653beffe196e33ec454a69064e31a68506"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.11.0/knilb-linux-arm64.tar.gz"
      sha256 "00046fd98783e22f0587c16c9791a24b66616983dab42b7585fbf611c9cf0e79"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.11.0/knilb-linux-x86_64.tar.gz"
      sha256 "d97c2d5c0e0c95b66a6f0fbe6c5eca27cd3bdaf3240ad9b3ec0b13cf01f9b30e"
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
