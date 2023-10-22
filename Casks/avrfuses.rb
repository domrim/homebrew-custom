cask "avrfuses" do
  version "1.6.1"
  sha256 "19c4040251268d7ea0a02dcf2ca4409d138f6983ca2ae1d38dd53bc95d931d4b"

  url "https://github.com/vonnieda/AVRFuses/releases/download/v#{version}/AVRFuses_#{version}.zip",
      verified: "github.com/vonnieda/AVRFuses/"
  name "AVRFuses"
  desc "Simple, graphical AVR fuse editor front end for avrdude"
  homepage "https://vonnieda.org/software/avrfuses"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "avrdude"

  app "AVRFuses.app"

  zap trash: [
    "~/Library/Preferences/org.vonnieda.AVRFuses.plist",
    "~/Library/Saved Application State/org.vonnieda.AVRFuses.savedState",
  ]
end
