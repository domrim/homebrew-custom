class MatrixMigrate < Formula
  desc "CLI to migrate one matrix account to a new one"
  homepage "https://gitlab.com/domrim/matrix-migrate"
  url "https://gitlab.com/domrim/matrix-migrate/-/archive/v0.3.0/matrix-migrate-v0.3.0.tar.gz"
  sha256 "2a67dafe2b29de9648fc09df8240bdf2a75a56b425a087e42deb653f52e77ee4"
  license "MIT"

  depends_on "rustup" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/matrix-migrate --version")
  end
end
