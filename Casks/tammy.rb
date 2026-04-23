cask "tammy" do
  arch arm: "arm64", intel: "x64"

  version "2.2.0"
  sha256 arm: "a490ad92fdcbbd4924800cdaec78613a55ca81b7b23be52ec76270b7489a9f42",
         intel: "c9110a6800dedfa71440f2740719620c7bf63f1ac3b2526f241fb1844883ce39"

  url "https://gitlab.com/api/v4/projects/61851918/packages/generic/Tammy-MacOS-#{arch}.dmg/#{version}/Tammy-MacOS-#{arch}-#{version}.dmg",
      verified: "gitlab.com/api/v4/projects/61851918"
  name "Tammy"
  desc "A fast and secure Matrix messenger"
  homepage "https://tammy.connect2x.de"

  livecheck do
    url "https://gitlab.com/connect2x/tammy.git"
  end

  app "Tammy.app"

  zap trash: [
    "~/Library/Application Support/de.connect2x.tammy",
    "~/Library/Preferences/de.connect2x.tammy.plist",
  ]
end
