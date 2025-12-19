class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "v0.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.1/mmcp-v0.0.1-macos-arm64.tar.gz"
      sha256 "7e099d18d70b4c43da916e0a08252f41d28fb8b8e3aff8667ff8fe48316a2899"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.1/mmcp-v0.0.1-linux-amd64.tar.gz"
      sha256 "fef83adef6f649006a14b13ef039f38c6cf816689d29a7a19a6f0581f834d08d"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.1/mmcp-v0.0.1-linux-arm64.tar.gz"
      sha256 "4ef05f6bf1da63e3c0e8c45bc07e8de720f921ea979d618351813a10005cd2e6"
    end
  end

  def install
    bin.install "mmcp"
    
    if OS.mac?
      system "xattr", "-d", "com.apple.quarantine", "#{bin}/mmcp"
    end
  end
end
