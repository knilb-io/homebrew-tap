class Knilb < Formula
  desc "Knilb command-line interface"
  homepage "https://github.com/knilb-io/knilb-dist"
  version "0.13.2"

  on_macos do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.13.2/knilb-macos-arm64.tar.gz"
      sha256 "dfd5fd18bf708de010e11a9c1d7891c18fa330add7fad6cf71e1586ece60904b"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.13.2/knilb-macos-x86_64.tar.gz"
      sha256 "e14704b44f5497c18220f52ad86a32b384c258d4514c3bdc76aaf89f686f65f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.13.2/knilb-linux-arm64.tar.gz"
      sha256 "202551f8974592b1543d83521bf59c885b0881a7cafac68c87a4d89031e16610"
    end

    on_intel do
      url "https://github.com/knilb-io/knilb-dist/releases/download/v0.13.2/knilb-linux-x86_64.tar.gz"
      sha256 "15c4d230375153e2bc0a6f71cc4c79a497616c4d8df1dcdbad877f0a320b9c44"
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
