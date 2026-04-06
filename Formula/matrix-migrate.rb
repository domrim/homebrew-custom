class MatrixMigrate < Formula
  desc "CLI to migrate one matrix account to a new one"
  homepage "https://gitlab.com/domrim/matrix-migrate"
  url "https://gitlab.com/domrim/matrix-migrate/-/archive/v0.2.0/matrix-migrate-v0.2.0.tar.gz"
  sha256 "86393a6f6cb2ecca8ec76277e36da103dd75005b842021ceda4babb3460b1402"
  license "MIT"

  depends_on "rustup" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/matrix-migrate --version")
  end
end
