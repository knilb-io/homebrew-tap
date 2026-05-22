class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.3.0/knilb-macos-arm64.tar.gz"
      sha256 "d975c2459ddbdc30961a5987d0b81fde08517baa24c12f2c85bf2e79a4c24c58"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.3.0/knilb-macos-x86_64.tar.gz"
      sha256 "03bfab43e5933ad516dd35db0789a409cd609338ea77275580ca4bd4b505929b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.3.0/knilb-linux-arm64.tar.gz"
      sha256 "0db8c98ef288fe86ccb44bf1e47456b3940bc748bd83bf51c0351c9175e7a0ba"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.3.0/knilb-linux-x86_64.tar.gz"
      sha256 "5f786f2ebe40a2801a1e63f2b22599ea6595d4bc9bf2d38a6e89905ba3c70e7b"
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
