class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.10.0"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.10.0/knilb-macos-arm64.tar.gz"
      sha256 "26f826af10618e0069abdcdb0ba49f6efd2224a8b22f4955b70af9a74441f889"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.10.0/knilb-macos-x86_64.tar.gz"
      sha256 "19619058138329ef2d1e9fe545c335baf198480c43350d67f0ed29ee3a673abe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.10.0/knilb-linux-arm64.tar.gz"
      sha256 "d274a8cfc608198e3fd962400aa044e2ba3d9e9a29889bb492e19ec9e9c1676b"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.10.0/knilb-linux-x86_64.tar.gz"
      sha256 "06c22775eb6bbfad90d051129bc0d80f8fa69c800c5773f9994660f4e6606e33"
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
