class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "v0.0.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.17/mmcp-v0.0.17-macos-arm64.tar.gz"
      sha256 "7327e28a53f8ebd6c96ee9c3c918ecbffee5c2d31f2338da658d89581e6239db"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.17/mmcp-v0.0.17-linux-amd64.tar.gz"
      sha256 "f060d9e4fd4c027ac9d8422f934cdc4594a21e96494b6b7daa4ece2aead9351e"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.17/mmcp-v0.0.17-linux-arm64.tar.gz"
      sha256 "dc6ce096069369ce51adf71b851ef7469dad816e8d3bf036be518db8819e23b4"
    end
  end

  def install
    bin.install "mmcp"
  end
end
