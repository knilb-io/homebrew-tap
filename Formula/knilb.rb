class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.3.1/knilb-macos-arm64.tar.gz"
      sha256 "7d0c1f8a75d4dfe3f200d86591fb63e560ed4fc3528b5238d93e0892a7bdc30b"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.3.1/knilb-macos-x86_64.tar.gz"
      sha256 "9182523bf7893ec50b30cd78ac69e3d1fad383cded80da1140df02b78a0ed9d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.3.1/knilb-linux-arm64.tar.gz"
      sha256 "af765ad643aae2c461aed14edb194d6520ec583326d98a1521d518e0dcea8b23"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.3.1/knilb-linux-x86_64.tar.gz"
      sha256 "1dc8500f9503b0270b01ec076407e69df1bc16cc7f476a73fdfd6066d225ceb9"
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
