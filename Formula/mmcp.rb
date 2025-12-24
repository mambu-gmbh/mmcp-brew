class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "v0.0.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.12/mmcp-v0.0.12-macos-arm64.tar.gz"
      sha256 "c50e16c507c1a274a578a9e08361ad04504f5524b5591e8ee2c7accb763f2e90"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.12/mmcp-v0.0.12-linux-amd64.tar.gz"
      sha256 "4cd372a1c4746cd25e6e2cb0bc8913a60e91372be9169edc0f7e2729907ac947"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.12/mmcp-v0.0.12-linux-arm64.tar.gz"
      sha256 "8dec421b51c5c77da07022f7654e041253f7cef2c14ea8a2a01c5d7e685624d9"
    end
  end

  def install
    bin.install "mmcp"
    
    if OS.mac?
      system "xattr", "-d", "com.apple.quarantine", "#{bin}/mmcp"
    end
  end
end
