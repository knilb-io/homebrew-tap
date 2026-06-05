class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.6.1/knilb-macos-arm64.tar.gz"
      sha256 "e992277b1ea81b61bcaafa6add51b5aa44831d5b25bcc60c0b9b2b8c50d8e408"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.6.1/knilb-macos-x86_64.tar.gz"
      sha256 "065d317accb0fe67d52f3d9ad58f4d8f98b69feb84a29dea314d22a8e74c317d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.6.1/knilb-linux-arm64.tar.gz"
      sha256 "ef27314cddd9d49d39795007694f1b885dbe54e942a40b3fc9bc5d357cf1eb27"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.6.1/knilb-linux-x86_64.tar.gz"
      sha256 "e94b6d3d09a15c1edd1ba49a0c43d50a133d466c4aa4cfbfe5d3cbb1ac4f631e"
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
