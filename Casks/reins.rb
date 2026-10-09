# Written by scripts/package/homebrew-cask.sh in katulevskiy/reins for each release; do not edit by hand.
cask "reins" do
  version "0.2.6"
  sha256 "1dd029b756ab027f576dd0fabbbb403016f01d6d85eb32ceefe6c8848234906b"

  url "https://github.com/katulevskiy/reins/releases/download/v#{version}/Reins-#{version}-macOS.dmg",
      verified: "github.com/katulevskiy/reins/"
  name "Reins"
  desc "Approve on your phone what your AI agents do with your accounts"
  homepage "https://reins2fa.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Reins.app"
  binary "#{appdir}/Reins.app/Contents/MacOS/reins"

  uninstall launchctl: "dev.reins.daemon",
            quit:      "com.reins2fa.desktop"

  zap trash: [
    "~/.config/reins",
    "~/.local/state/reins",
    "~/Library/LaunchAgents/dev.reins.daemon.plist",
    "~/Library/Logs/reins.log",
  ]
end
