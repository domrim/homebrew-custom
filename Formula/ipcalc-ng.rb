class IpcalcNg < Formula
  desc "Modern IPv4/IPv6 ipcalc tool"
  homepage "https://gitlab.com/ipcalc/ipcalc"
  url "https://gitlab.com/ipcalc/ipcalc/-/archive/1.0.3/ipcalc-1.0.3.tar.gz"
  sha256 "451f323764f37ea6057e0ade60a0473938232ab2a92b97ffdc8c4860a8c76cfc"
  license ""

  depends_on "meson" => :build
  depends_on "ninja" => :build

  conflicts_with "ipcalc", because: "ipcalc also ships a ipcalc binary"

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ipcalc-ng`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
