cask "tammy" do
  arch arm: "arm64", intel: "x64"

  version "26.6.3"
  sha256 arm:   "5a361509a48393c01fd5d37551999cce47c3adfd39444c03a89207ea23d1c29d",
         intel: "b8eb30d9d39ef5f3523188c91c1843a894ca1278a37983c8b34d9783ad61342a"

  url "https://gitlab.com/api/v4/projects/61851918/packages/generic/Tammy-MacOS-#{arch}.dmg/#{version}/Tammy-MacOS-#{arch}-#{version}.dmg"
  name "Tammy"
  desc "Fast and secure Matrix messenger"
  homepage "https://tammy.connect2x.de/"

  livecheck do
    url "https://gitlab.com/connect2x/tammy.git"
  end

  depends_on :macos

  app "Tammy.app"

  zap trash: [
    "~/Library/Application Support/de.connect2x.tammy",
    "~/Library/Preferences/de.connect2x.tammy.plist",
  ]
end
