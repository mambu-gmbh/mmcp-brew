class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "v0.0.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.8/mmcp-v0.0.8-macos-arm64.tar.gz"
      sha256 "bfb845ebb8d581390608f567010ea71a4543d12f761fa5ddae2cc116732934ba"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.8/mmcp-v0.0.8-linux-amd64.tar.gz"
      sha256 "db112aa93864b6a60b289ce8b474bf8d544e22c32ad4a1f4cc9392573fc30355"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.8/mmcp-v0.0.8-linux-arm64.tar.gz"
      sha256 "a380a00aee9cec6c6a91de42e61d441b277a1db24dd6335225bea1244a68bf20"
    end
  end

  def install
    bin.install "mmcp"
    
    if OS.mac?
      system "xattr", "-d", "com.apple.quarantine", "#{bin}/mmcp"
    end
  end
end
