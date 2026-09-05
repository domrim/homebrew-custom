cask "openterface" do
  version "2.1"
  sha256 "373c1ec5940aa2e817abab560e8a0b381d3db978863058593fc30bd260da79b1"

  url "https://github.com/TechxArtisanStudio/Openterface_MacOS/releases/download/v#{version}/Openterface.dmg"
  name "Openterface"
  desc "Openterface KVM allows you to control a headless target device, such as a mini PC, kiosk, or server, directly from your laptop or desktop without the need for an extra keyboard, mouse, and monitor."
  homepage "https://openterface.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Openterface.app"

  zap trash: [
    "~/Library/Application Scripts/com.openterface.macOS",
    "~/Library/Containers/com.openterface.macOS",
  ]
end
