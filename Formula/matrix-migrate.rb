class MatrixMigrate < Formula
  desc "CLI to migrate one matrix account to a new one"
  homepage "https://gitlab.com/domrim/matrix-migrate"
  url "https://gitlab.com/domrim/matrix-migrate/-/archive/v0.4.0/matrix-migrate-v0.4.0.tar.gz"
  sha256 "ce138356bf07818c274e23383db537f58ad4925e6ed777e62ae609de8905f43d"
  license "MIT"
  head "https://gitlab.com/domrim/matrix-migrate.git", branch: "main"

  depends_on "rustup" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"matrix-migrate", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/matrix-migrate --version")
  end
end
