class ElementProfiles < Formula
  desc "Manage per-account Element (Matrix) profile applications with custom icons"
  homepage "https://gitlab.net.scc.kit.edu/collective-ai-slop/element-profiles"
  url "https://gitlab.net.scc.kit.edu/collective-ai-slop/element-profiles/-/archive/v0.3.0/element-profiles-v0.3.0.tar.gz"
  sha256 "8363546e94c2baed3a9d00bf555fbdfdf7752114cfdab4ebeda6d703627c0ccf"
  head "https://gitlab.net.scc.kit.edu/collective-ai-slop/element-profiles.git", branch: "main"

  depends_on xcode: :build
  depends_on :macos
  uses_from_macos "swift", since: :tahoe # Swift 6.2

  def install
    chdir "ElementProfiles" do
      system "swift", "build", "--disable-sandbox", "-c", "release"
      bin.install ".build/release/element-profiles"
    end

    generate_completions_from_executable(bin/"element-profiles", "--generate-completion-script")
  end

  test do
    assert_match "Manage Element profile applications.", shell_output("#{bin}/element-profiles --help")
  end
end
