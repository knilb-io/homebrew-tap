class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.9.3"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.9.3/knilb-macos-arm64.tar.gz"
      sha256 "5857bb54e4099bb708646b9606daa83b5b217432e590a2eeb52ac250ec72f251"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.9.3/knilb-macos-x86_64.tar.gz"
      sha256 "aa92ca735f90865002bc6819eb34e99e0bd0747c649bb188ab293a3c64144797"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.9.3/knilb-linux-arm64.tar.gz"
      sha256 "40fc23dec288d938dcc99c6e61fc6fde4e1f693a46f1b7ab6e8b40697add7aa8"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.9.3/knilb-linux-x86_64.tar.gz"
      sha256 "b5ffe65e10b957d5b7d3218a7ab54848b671c01e0aa67cc713e81afec9506ffc"
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
