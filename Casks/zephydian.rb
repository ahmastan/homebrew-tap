cask "zephydian" do
  version "0.1.0"
  sha256 "4e4f94a3a07588356fe6ad7a40e22744aa73b3e65ec829a84c3c6bd705d761a4"

  url "https://github.com/ahmastan/zephydian/releases/download/v#{version}/Zephydian-#{version}.zip"
  name "Zephydian"
  desc "Menu bar notes scratchpad and small games, opened from a screen corner"
  homepage "https://github.com/ahmastan/zephydian"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Zephydian.app"

  uninstall quit: "com.ahmastan.zephydian"

  zap trash: [
    "~/Library/Application Scripts/com.ahmastan.zephydian",
    "~/Library/Containers/com.ahmastan.zephydian",
  ]

  caveats <<~EOS
    Zephydian isn't signed with an Apple Developer ID yet, so macOS blocks the first launch.
    To open it, try once, then go to System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
