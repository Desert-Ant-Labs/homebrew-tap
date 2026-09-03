# Homebrew formula for desertant. This is the template: the release workflow fills in
# the version and checksums (Tools/render-formula), and Tools/publish-formula puts
# the result in Desert-Ant-Labs/homebrew-tap.
class Desertant < Formula
  desc "Runs Desert Ant Labs on-device models from the terminal"
  homepage "https://github.com/Desert-Ant-Labs/desert-ant-cli"
  version "0.1.0"
  license "MIT"

  base = "https://github.com/Desert-Ant-Labs/desert-ant-cli/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/desertant-darwin-arm64.tar.gz"
      sha256 "2500733dd5ec6b4dc7a5ce63a09df56226930d4d77df9841c321c3c4d1fb8fb6"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/desertant-linux-arm64.tar.gz"
      sha256 "e6fddc260d6755a34fa00b0513b661aa0f7f031f0a7888119a74e81e36122dcd"
    end
    on_intel do
      url "#{base}/desertant-linux-x86_64.tar.gz"
      sha256 "66676711812a9ec7852ef4bf270201a8403242195101bd674b9f939bbc4a08a4"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on macos: :sonoma

  def install
    # The binary looks for mlx.metallib (macOS) or libLiteRt.so (Linux) beside itself.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"desertant"
    bin.install_symlink libexec/"desertant" => "da"
  end

  # The model cache under ~/Library/Caches/desert-ant-models is shared with every
  # Desert Ant app, so uninstalling desertant leaves it in place.

  test do
    assert_match "desert-ant-core", shell_output("#{bin}/desertant --version")
  end
end
