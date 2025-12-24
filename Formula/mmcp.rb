class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "v0.0.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.11/mmcp-v0.0.11-macos-arm64.tar.gz"
      sha256 "e94f49b859989416ffff49355f3de45c77c5ad08f995f1fa5ff27d725c08b284"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.11/mmcp-v0.0.11-linux-amd64.tar.gz"
      sha256 "2a0206e2c9ca8569d633211abac213f9a91bf6216590fdd8b51bcf76a6f28a97"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.11/mmcp-v0.0.11-linux-arm64.tar.gz"
      sha256 "3a5d110b8ab0f6c8703c59a1de8119c394fb521e1d087462545434ea963472eb"
    end
  end

  def install
    bin.install "mmcp"
    
    if OS.mac?
      system "xattr", "-d", "com.apple.quarantine", "#{bin}/mmcp"
    end
  end
end
