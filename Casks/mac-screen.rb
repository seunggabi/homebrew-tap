cask "mac-screen" do
  version "0.4.7"
  sha256 "0cbdd1c7dd8952f9cc6fc80a08e16604a1aaf004ec7e83faa60f4369854ddf3e"

  url "https://github.com/seunggabi/mac-screen/releases/download/v#{version}/MacScreen-#{version}.dmg"
  name "MacScreen"
  desc "macOS window management app with flexible screen splitting"
  homepage "https://github.com/seunggabi/mac-screen"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "MacScreen.app"

  uninstall_preflight do
    system_command "/usr/bin/killall",
                   args: ["-9", "MacScreen"],
                   print_stderr: false
  end

  uninstall quit:   "com.seunggabi.mac-screen",
            delete: "/Applications/MacScreen.app"

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
