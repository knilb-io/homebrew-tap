class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.2.0/knilb-macos-arm64.tar.gz"
      sha256 "f30f6727ef1ed1398c744c1b6b6849edb201819a86cda6a44b620b8094bda03c"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.2.0/knilb-macos-x86_64.tar.gz"
      sha256 "d40f4a84a4370dcc507db873a35569759999f9e0bde6ba46b85e89a7c023c86c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.2.0/knilb-linux-arm64.tar.gz"
      sha256 "0208d104c2e42239adae03fe5c417cc3feb94e9d95764986ad128a0290556264"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.2.0/knilb-linux-x86_64.tar.gz"
      sha256 "83c84792bbd5bcac60e42c1889997ff993d9f6c43f36f91ce856ad1e1dda675f"
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
