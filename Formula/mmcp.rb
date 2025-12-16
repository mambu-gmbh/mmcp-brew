class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "0.0.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp/releases/download/v#{version}/mmcp-darwin-arm64.tar.gz"
      sha256 "a38d08907de2ef7a7449820712d71491e272a52449bfb8778652f0febd5390c2"
    end
  end

=begin
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp/releases/download/v#{version}/mmcp-linux-amd64.tar.gz"
      sha256 "REPLACE_WITH_LINUX_AMD64_SHA256"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp/releases/download/v#{version}/mmcp-linux-arm64.tar.gz"
      sha256 "REPLACE_WITH_LINUX_ARM64_SHA256"
    end
  end
=end

  def install
    bin.install "mmcp"
    
    # Remove macOS quarantine attribute to prevent "unidentified developer" warnings
    if OS.mac?
      system "xattr", "-d", "com.apple.quarantine", "#{bin}/mmcp"
    end
  end

=begin
  test do
    system "#{bin}/mmcp", "--version"
  end
=end

end
