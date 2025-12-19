class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "v0.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.1/mmcp-v0.0.1-macos-arm64.tar.gz"
      sha256 "98f47a2536f357f5869547b1b71cb9cf6140a9f2bff0c9d45900fb3b9eea78e1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.1/mmcp-v0.0.1-linux-amd64.tar.gz"
      sha256 "73dac9bb520743e59d1950b60be251ecd8d5d569c91857f3abec55e2689b563c"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.1/mmcp-v0.0.1-linux-arm64.tar.gz"
      sha256 "a46c92805c63e0d66c9d900e0164ce06f4900b5ce96d44921d1fcbe69a7622b7"
    end
  end

  def install
    bin.install "mmcp"
    
    if OS.mac?
      system "xattr", "-d", "com.apple.quarantine", "#{bin}/mmcp"
    end
  end
end
