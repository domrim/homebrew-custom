class MagicWormholeRs < Formula
  desc "Rust implementation of Magic Wormhole, with new features and enhancements"
  homepage "https://github.com/magic-wormhole/magic-wormhole.rs"
  url "https://github.com/magic-wormhole/magic-wormhole.rs/archive/refs/tags/0.6.0.tar.gz"
  sha256 "cfa72215b1b0f519b9986523d0c41d6b3e562c41668f28ee80c23ce0aa3fe685"
  license "EUPL-1.2"
  head "https://github.com/magic-wormhole/magic-wormhole.rs.git", branch: "master"

  livecheck do
    url :stable
    regex(/^?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "cli")
  end

  test do
    expected = "wormhole-rs #{version}"
    output = shell_output("#{bin}/wormhole-rs -V").each_line.first.strip
    assert_match expected, output
  end
end
