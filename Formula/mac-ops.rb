class MacOps < Formula
  desc "macOS system optimization CLI tool"
  homepage "https://github.com/seunggabi/mac-ops"
  url "https://github.com/seunggabi/mac-ops/releases/download/v1.5.1/patched.tar.gz"
  sha256 "2a727f9b529b7b3b6d0c480145019dceb971205f171b7ca9c810fcec425bb63c"
  license "MIT"

  depends_on :macos

  def install
    libexec.install Dir["*"]
    (bin/"mac-ops").write <<~EOS
      #!/bin/zsh
      exec "#{libexec}/bin/mac-ops" "$@"
    EOS
    chmod 0755, bin/"mac-ops"
  end

  def caveats
    <<~EOS
      To enable scheduled cleanup, run:
        mac-ops install

      Full Disk Access is required for some cleanup operations.
      Go to System Settings > Privacy & Security > Full Disk Access
      and add your terminal application.
    EOS
  end

  test do
    assert_match "mac-ops v", shell_output("#{bin}/mac-ops version")
  end
end
