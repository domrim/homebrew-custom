cask "tammy" do
  arch arm: "arm64", intel: "x64"

  version "26.4.2"
  sha256 arm:   "6b91071610ff33e8fe3ad96a91e4cd3ed0bed8526af4aec9f543199765866084",
         intel: "de99c7f869d036a99d391e72c5d161ddf72b7cab834a98f66e1877d5149f7ff6"

  url "https://gitlab.com/api/v4/projects/61851918/packages/generic/Tammy-MacOS-#{arch}.dmg/#{version}/Tammy-MacOS-#{arch}-#{version}.dmg",
      verified: "gitlab.com/api/v4/projects/61851918/"
  name "Tammy"
  desc "Fast and secure Matrix messenger"
  homepage "https://tammy.connect2x.de/"

  livecheck do
    url "https://gitlab.com/connect2x/tammy.git"
  end

  app "Tammy.app"

  zap trash: [
    "~/Library/Application Support/de.connect2x.tammy",
    "~/Library/Preferences/de.connect2x.tammy.plist",
  ]
end
