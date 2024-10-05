# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Blisp < Formula
  desc "ISP tool & library for Bouffalo Labs RISC-V Microcontrollers and SoCs"
  homepage ""
  url "https://github.com/pine64/blisp/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "288a8165f7dce604657f79ee8eea895cc2fa4e4676de5df9853177defd77cf78"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "libserialport" => :build
  depends_on "argtable3" => :build
  depends_on "pkgconfig" => :build

  def install
    system "cmake", "-DBLISP_USE_SYSTEM_LIBRARIES=ON", "-DBLISP_BUILD_CLI=ON" "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test blisp`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
