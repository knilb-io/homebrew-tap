class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.9.1"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.9.1/knilb-macos-arm64.tar.gz"
      sha256 "e371a3e11f11082c11611a342350e93a68bd3d4ade1a7ab907a3b657ccba0ff8"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.9.1/knilb-macos-x86_64.tar.gz"
      sha256 "07f9e0cfd82e3266330276330b777f82786b83a273e877de5525cff07a90c243"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.9.1/knilb-linux-arm64.tar.gz"
      sha256 "f8c897a76e5552baade172cb219c1cd4a430942f7114faf2a4875e558fa03170"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.9.1/knilb-linux-x86_64.tar.gz"
      sha256 "62f7a9a2b33bbac869f235530985bc3830354d3fd9daedfd06faed66e312fd5e"
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
