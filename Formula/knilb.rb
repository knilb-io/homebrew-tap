class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.9.2"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.9.2/knilb-macos-arm64.tar.gz"
      sha256 "fb35a81bf4ecbd4e0725a98cc1689e5097b59d9c3e77738e1314500967fb8010"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.9.2/knilb-macos-x86_64.tar.gz"
      sha256 "2f753eeecd41c6975c4982ac4a08828a2dd46ab9f0228a08a47adaf7901228e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.9.2/knilb-linux-arm64.tar.gz"
      sha256 "b225e943ae35de5de020106c65efb0bd10df75990f9e94518f2521d872faa5d0"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.9.2/knilb-linux-x86_64.tar.gz"
      sha256 "9111ed7369a6c0c08692772a29161e553ab624d4ec53612cc01a62678e0fc2b6"
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
