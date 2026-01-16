class Mmcp < Formula
  desc "Mambu MCP Server"
  homepage "https://www.mambu.com"
  version "v0.0.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.16/mmcp-v0.0.16-macos-arm64.tar.gz"
      sha256 "b8a39f3d8489307302c20f4f47a151cf2d98a66975281fab863ffee36b099e8c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.16/mmcp-v0.0.16-linux-amd64.tar.gz"
      sha256 "2a193854d7bac9e5c17ca740f161ca1f8d4c7f18fd74dfc306b6d8aadc8aa49f"
    elsif Hardware::CPU.arm?
      url "https://github.com/mambu-gmbh/mmcp-brew/releases/download/v0.0.16/mmcp-v0.0.16-linux-arm64.tar.gz"
      sha256 "11b03fd156a01143e99ce04b565ce7daf4e87b7e5a6c9d9b60923746a51b7fe2"
    end
  end

  def install
    bin.install "mmcp"
  end
end
