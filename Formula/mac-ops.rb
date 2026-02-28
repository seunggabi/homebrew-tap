class MacOps < Formula
  desc "macOS system optimization CLI tool"
  homepage "https://github.com/seunggabi/mac-ops"
  url "https://github.com/seunggabi/mac-ops/releases/download/v1.3.0/patched.tar.gz"
  sha256 "678b8492f4e07de7e0aa739eb7df5f43ede341d6084b44f3cce6f651c5e35b1e"
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
