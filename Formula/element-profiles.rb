class ElementProfiles < Formula
  desc "Manage per-account Element (Matrix) profile applications with custom icons"
  homepage "https://gitlab.net.scc.kit.edu/collective-ai-slop/element-profiles"
  url "https://gitlab.net.scc.kit.edu/collective-ai-slop/element-profiles/-/archive/v0.3.1/element-profiles-v0.3.1.tar.gz"
  sha256 "43deef72ed8ab905be302bc850512252af1fc81c07c9e5c56b525ceec25e78b6"
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
