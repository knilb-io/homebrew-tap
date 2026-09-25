class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.8.0/knilb-macos-arm64.tar.gz"
      sha256 "ea3b48dc28710328fdb56436fee5f1da900b2205c13525f8213c0263cf76753f"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.8.0/knilb-macos-x86_64.tar.gz"
      sha256 "10b45ecfe45cadca08df5df034ba872c202f65bc968342793e12211134dd8cff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.8.0/knilb-linux-arm64.tar.gz"
      sha256 "7c79056749f97655414caa7f8735810f0d3af83b2d80d3d06fe6488e51348923"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.8.0/knilb-linux-x86_64.tar.gz"
      sha256 "4ee808edc31cebbde9a3eb997c5eef830d207ab2c5d4b42bc1a8cbda578ae4d9"
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
