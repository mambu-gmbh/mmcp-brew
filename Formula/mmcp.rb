class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "v0.0.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.7/mmcp-v0.0.7-macos-arm64.tar.gz"
      sha256 "0a94e8ba8023b9eabbc661eb2db0f19b34516b336ec14086d76c3d3e885d6086"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.7/mmcp-v0.0.7-linux-amd64.tar.gz"
      sha256 "e06a7de31473987e1b00272939c6e592bd5271880d70ee4b48784281bda6f0cc"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.7/mmcp-v0.0.7-linux-arm64.tar.gz"
      sha256 "6ea4b5a4b443d72c80bbba42d78f802b47a86707da64ac11f5eee961ed931e71"
    end
  end

  def install
    bin.install "mmcp"
    
    if OS.mac?
      system "xattr", "-d", "com.apple.quarantine", "#{bin}/mmcp"
    end
  end
end
