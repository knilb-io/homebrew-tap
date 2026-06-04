class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.6.0/knilb-macos-arm64.tar.gz"
      sha256 "fea6a6b2fac3f762a1f3462bc2117c48f827e4bccc5e33c8b1d7ba4f67d5b7c1"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.6.0/knilb-macos-x86_64.tar.gz"
      sha256 "64de34b6f86b9055b8483d0c184747613bb8d1790b966935bdcd0b3aaf9637f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.6.0/knilb-linux-arm64.tar.gz"
      sha256 "4fb092175c3e42f2ac7733539f08a9cbd489c6e102e12fed658f5cb007cb2b89"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.6.0/knilb-linux-x86_64.tar.gz"
      sha256 "ce7ec70b143bf34d7fd2047ac1bf9650937795b4b00ee236f8713a129cbfa22c"
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
