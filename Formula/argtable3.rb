# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Argtable3 < Formula
  desc "A single-file, ANSI C, command-line parsing library that parses GNU-style command-line options."
  homepage "http://www.argtable.org"
  url "https://github.com/argtable/argtable3/archive/refs/tags/v3.2.2.f25c624.tar.gz"
  sha256 "a5c66d819fa0be0435f37ed2fb3f23e371091722ff74219de97b65f6b9914e51"
  license "NOASSERTION"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test argtable3`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
