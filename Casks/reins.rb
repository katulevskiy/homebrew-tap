# Written by scripts/package/homebrew-cask.sh in katulevskiy/reins for each release; do not edit by hand.
cask "reins" do
  version "0.25.0"
  sha256 "1ccfb06789d43a59135456b990783e3c547f3df8c020594b91005739db7b2c24"

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
