# Written by scripts/package/homebrew-cask.sh in katulevskiy/reins for each release; do not edit by hand.
cask "reins" do
  version "0.32.2"
  sha256 "d31690f00f3e7524eba2e082a7302302fd5353a922754aa8ef379833f878f0d2"

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
