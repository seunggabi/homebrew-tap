class MacOps < Formula
  desc "macOS system optimization CLI tool"
  homepage "https://github.com/seunggabi/mac-ops"
  url "https://github.com/seunggabi/mac-ops/archive/refs/tags/v1.1.6.tar.gz"
  sha256 "9992faa6ecd2558535a3df3ae2adfdc8233aff0e63f3f9f32a599f177f606c5e"
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
