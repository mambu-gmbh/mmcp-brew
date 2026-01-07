class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "v0.0.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.15/mmcp-v0.0.15-macos-arm64.tar.gz"
      sha256 "c21e8fe7999ae4839be8ecedc3704646087527852da7867ed10cb61e829e5be5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.15/mmcp-v0.0.15-linux-amd64.tar.gz"
      sha256 "53bc1104e6ceda906c93020879b66cfcb53a099cc623c3f3c5a947fd326ab001"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.15/mmcp-v0.0.15-linux-arm64.tar.gz"
      sha256 "45d808f284b9908e3615cf34b547351e00c8153c7acdb747cd271c996f159d0f"
    end
  end

  def install
    bin.install "mmcp"
  end
end
