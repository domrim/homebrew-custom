class Lpac < Formula
  desc "C-based eUICC LPA"
  homepage "https://github.com/estkme-group/lpac"
  url "https://github.com/estkme-group/lpac/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "661dffbd1e9e5732dab4a0bb0a9837d4906c8c66bd748bda262fe3e8d3e420f6"
  license "AGPL-3.0"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test lpac`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
