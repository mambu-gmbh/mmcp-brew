class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "v0.0.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.14/mmcp-v0.0.14-macos-arm64.tar.gz"
      sha256 "1fb9d985780ce4ede63eaf18b3db6c7755df230f1a6e44b3aea1d5dee49f7758"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.14/mmcp-v0.0.14-linux-amd64.tar.gz"
      sha256 "951da730e9cf5c42ea65baca1baa7c329d1be57d45bf48b90c692dbe8326503a"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.14/mmcp-v0.0.14-linux-arm64.tar.gz"
      sha256 "996ee3966a915108d29bd18b614da29808b2ae9f93f149767f2a66cb97cf4aea"
    end
  end

  def install
    bin.install "mmcp"
    
    if OS.mac?
      system "xattr", "-d", "com.apple.quarantine", "#{bin}/mmcp"
    end
  end
end
