class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.13.0"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.13.0/knilb-macos-arm64.tar.gz"
      sha256 "65357712565147f94a20f5667398c58bf47675fd55a58254f0c32ea9c8beddbd"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.13.0/knilb-macos-x86_64.tar.gz"
      sha256 "2934e27506e11f06e6072df1dca3fc013fa456af63869b5e46d183e67a34cde2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.13.0/knilb-linux-arm64.tar.gz"
      sha256 "52f1a5b7f8905dfb5161edf46f392fe3cb492d94348444ae513a523b99704b8f"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.13.0/knilb-linux-x86_64.tar.gz"
      sha256 "3b7fe1244f6f80eb8bcdaa14c26f84d99cd276923166aa19909f62ceda978657"
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
