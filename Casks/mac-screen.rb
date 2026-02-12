cask "mac-screen" do
  version "0.3.0"
  sha256 "d5d1535bf83e8a7e0123ba5ec193d022521d32100a7170bdc54d217808bd6ffa"

  url "https://github.com/seunggabi/mac-screen/releases/download/v#{version}/MacScreen-#{version}.dmg"
  name "MacScreen"
  desc "macOS window management app with flexible screen splitting"
  homepage "https://github.com/seunggabi/mac-screen"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "MacScreen.app"

  uninstall quit: "com.seunggabi.mac-screen"

  zap trash: [
    "~/Library/Preferences/com.seunggabi.mac-screen.plist",
    "~/Library/Caches/com.seunggabi.mac-screen",
    "~/Library/Application Support/MacScreen",
    "~/Library/Logs/MacScreen",
  ]

  caveats <<~EOS
    MacScreen requires Accessibility permission to manage windows.

    On first launch, you will be prompted to grant permission in:
    System Settings > Privacy & Security > Accessibility

    Default keyboard shortcuts:
    - Ctrl+Option+Left/Right: Left/Right half
    - Ctrl+Option+Return: Maximize
    - Ctrl+Option+C: Center
    - Ctrl+Option+Q/W/A/S: Quarters

    For more information, visit:
    https://github.com/seunggabi/mac-screen
  EOS
end
