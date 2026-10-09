# Homebrew tap for Reins

[Reins](https://reins2fa.com) lets you approve, on your phone, what your AI agents do with your accounts.

```sh
brew install --cask katulevskiy/tap/reins
```

This installs the Reins desktop app (`Reins.app`, signed with a Developer ID and notarized by Apple) and links the
`reins` command that comes with it. The app keeps itself up to date; `brew upgrade --greedy reins` also works.

`Casks/reins.rb` is written for every release by the Reins release workflow
([source](https://github.com/katulevskiy/reins/blob/main/scripts/package/homebrew-cask.sh)); don't edit it by hand.
