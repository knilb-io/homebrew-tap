class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.12.0"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.12.0/knilb-macos-arm64.tar.gz"
      sha256 "dd3eebc85f6262575c9e2ad3fdd9beeef309592486315a55fe887b20f6261d06"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.12.0/knilb-macos-x86_64.tar.gz"
      sha256 "d2d8dee12a4f3aed7a6a4ed1bca69dafa1b2095007cbc48c53f5811a2beae90e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.12.0/knilb-linux-arm64.tar.gz"
      sha256 "83068d474a92a2387144c84ab7e07d117ba8cc6fc4191e7f27616b1db775a2e4"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.12.0/knilb-linux-x86_64.tar.gz"
      sha256 "535b0c3aef5c53d1c5a41980a59eb58b25b0a51b3c7310ec2fed791ee60f9d51"
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
