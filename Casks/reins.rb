# Written by scripts/package/homebrew-cask.sh in katulevskiy/reins for each release; do not edit by hand.
cask "reins" do
  version "0.5.27"
  sha256 "c97bf31575661e9f67c4e7722f2e39ad06638024fb5d89696d3042df2d32a158"

  url "https://github.com/katulevskiy/reins/releases/download/v#{version}/Reins-#{version}-macOS.dmg"
  name "Reins"
  desc "Approve on your phone what your AI agents do with your accounts"
  homepage "https://reins2fa.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Reins.app"
  binary "#{appdir}/Reins.app/Contents/MacOS/reins"

  uninstall launchctl: [
              "com.reins2fa.desktop",
              "dev.reins.daemon",
            ],
            quit:      "com.reins2fa.desktop"

  # Only what Reins writes: ~/.config/reins may hold the user's own files too, so it goes only once empty.
  zap trash: [
        "~/.config/reins/config.toml",
        "~/.local/state/reins",
        "~/Library/LaunchAgents/com.reins2fa.desktop.plist",
        "~/Library/LaunchAgents/dev.reins.daemon.plist",
        "~/Library/Logs/reins.log",
      ],
      rmdir: "~/.config/reins"
end
