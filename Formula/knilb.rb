class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.5.0/knilb-macos-arm64.tar.gz"
      sha256 "51fe4ec605ad16a967e4bf2360d522ff58040ff78c483315fd4e11752952e206"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.5.0/knilb-macos-x86_64.tar.gz"
      sha256 "8f8583bd44c0dea5b09187e28dd56de8758866952240c0e6a7768197943139c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.5.0/knilb-linux-arm64.tar.gz"
      sha256 "c3d3b3165383ff8c96dd9363335d538d9475592bea536c73f6d92967793ffbee"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.5.0/knilb-linux-x86_64.tar.gz"
      sha256 "8573a6653e2e61daf7a6a252eea35268a0df7c5478e43ff53a3d3d6a7a72d3bf"
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
