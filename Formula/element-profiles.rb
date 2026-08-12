class ElementProfiles < Formula
  desc "Manage per-account Element (Matrix) profile applications with custom icons"
  homepage "https://gitlab.net.scc.kit.edu/collective-ai-slop/element-profiles"
  url "https://gitlab.net.scc.kit.edu/collective-ai-slop/element-profiles/-/archive/v0.2.0/element-profiles-v0.2.0.tar.gz"
  sha256 "a582757881e4bbf679cabf9602838decd1f1eb61bebe7028802b7610bbd0dd76"
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
