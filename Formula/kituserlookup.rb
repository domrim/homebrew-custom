class Kituserlookup < Formula
  desc "KIT AD Query Tool"
  homepage "https://gitlab.kit.edu/kit/kit-cert/tools/kituserlookup"
  url "https://gitlab.kit.edu/kit/kit-cert/tools/kituserlookup/-/archive/v2.2.19/kituserlookup-v2.2.19.tar.gz"
  sha256 "8c72a1ed1180f94029c83ad451e781067d86643d4473b3d39462a16a2fe64951"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test kituserlookup`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
