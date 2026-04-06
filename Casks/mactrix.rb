cask "mactrix" do
  version "0.1.0"
  sha256 "4e355f69c83d4e34c1fc7e362696cab88a46fdaf62190f50fe1d5861a654422f"

  url "https://github.com/viktorstrate/mactrix/releases/download/v#{version}/Mactrix.app.zip"
  name "Mactrix"
  desc "Native Matrix client for macOS"
  homepage "https://github.com/viktorstrate/mactrix"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "Mactrix.app"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: ""
end
