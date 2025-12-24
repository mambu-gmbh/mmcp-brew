class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "v0.0.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.10/mmcp-v0.0.10-macos-arm64.tar.gz"
      sha256 "8f3f8a532d54c81ccfce033df87897759f3373765db85cfcd4649aaaa4f922eb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.10/mmcp-v0.0.10-linux-amd64.tar.gz"
      sha256 "55446080a5cad4f5dc28dc0d3c1022088166ea2def226c2798972642ee914c14"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.10/mmcp-v0.0.10-linux-arm64.tar.gz"
      sha256 "fe5cab42a0a7664ce11e29660b2f2b3a70ae2c6ad75dab5a6634ac3f684d589f"
    end
  end

  def install
    bin.install "mmcp"
    
    if OS.mac?
      system "xattr", "-d", "com.apple.quarantine", "#{bin}/mmcp"
    end
  end
end
