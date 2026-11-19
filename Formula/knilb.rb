class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.14.0"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.14.0/knilb-macos-arm64.tar.gz"
      sha256 "5846a60aa66d6048caf4322611d8b5ac62124c6b600984a5808d8fe2e75dcfe4"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.14.0/knilb-macos-x86_64.tar.gz"
      sha256 "26be424b95209d4ae0155ea3b9686eb745e60a9313850f0228e93c617f6f25bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.14.0/knilb-linux-arm64.tar.gz"
      sha256 "8d54fe4f7deb64074351779342d2b3748feee12c4a0fc5d53ca52dacc85b5a60"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.14.0/knilb-linux-x86_64.tar.gz"
      sha256 "94f69190ebb1d3195e444baf6c379a2097864e9c69ecaad23dac355a30545e8d"
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
