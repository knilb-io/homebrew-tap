class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.7.0/knilb-macos-arm64.tar.gz"
      sha256 "76260f5ed9f159c7942a740513661594089de8301a62441fc1dba11ae325fd05"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.7.0/knilb-macos-x86_64.tar.gz"
      sha256 "02860185e6af765ecd40d54c7a753f6889359f1bb19da99f58e58293b9be122b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.7.0/knilb-linux-arm64.tar.gz"
      sha256 "a716a7aa155c4abc11a80f44df9e1c164d421a5f8c3f850d04f8312b0aaeb3ac"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.7.0/knilb-linux-x86_64.tar.gz"
      sha256 "3ab2d1eceae81d0192bd576995a0da7e0c237f70595d36111fe4cf17a3220d15"
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
