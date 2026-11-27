class MacOps < Formula
  desc "macOS system optimization CLI tool"
  homepage "https://github.com/seunggabi/mac-ops"
  url "https://github.com/seunggabi/mac-ops/releases/download/v1.4.2/patched.tar.gz"
  sha256 "a389b150e98dcea37c47b9a2a081928b9be5c810891dfc7a7cf974ced6b55d4f"
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
