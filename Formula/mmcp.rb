class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "v0.0.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.9/mmcp-v0.0.9-macos-arm64.tar.gz"
      sha256 "7e6b9010353e62ff3a4915e82ae3750bcd4a0a2bc8c28a1022df4ae433ba7680"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.9/mmcp-v0.0.9-linux-amd64.tar.gz"
      sha256 "958497fb577db5d47d6d0af676093807de1d4fb9205ce3720dbd76a863f4461b"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.9/mmcp-v0.0.9-linux-arm64.tar.gz"
      sha256 "4a0e10db08c4225385d6b1f520c600dfa2207cf99e846e217c267e88b6be4855"
    end
  end

  def install
    bin.install "mmcp"
    
    if OS.mac?
      system "xattr", "-d", "com.apple.quarantine", "#{bin}/mmcp"
    end
  end
end
