class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.4.0/knilb-macos-arm64.tar.gz"
      sha256 "71d0620f34bddd5ec6c66e0b610818729ef02aaa6e34e4d79a7000d8fb77ef8d"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.4.0/knilb-macos-x86_64.tar.gz"
      sha256 "0a0ff1e560998ed8b2fa61ea320682c5992adce963851909833d85fa0b79dc77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.4.0/knilb-linux-arm64.tar.gz"
      sha256 "42759820792951951448e9dff4342024c15a5693cdc68d20105784427de03f02"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.4.0/knilb-linux-x86_64.tar.gz"
      sha256 "4ae00b6467abf16bc557cb91bab874d8e3a99a6c95aa6719d4d011014a8d9d3d"
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
