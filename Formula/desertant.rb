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
      sha256 "c7b12163d6a3bcac84deae7cb7b78de7120e0db0093bdbaf0ce615ba46b7dc59"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/desertant-linux-arm64.tar.gz"
      sha256 "98c042eab341a73f481039f4acf04caead45ef442dfc2a88d2f4aff0c9af37d4"
    end
    on_intel do
      url "#{base}/desertant-linux-x86_64.tar.gz"
      sha256 "c76e9228af7b7a9c3377e33d1410241c9f1850abadaade0ac1453f0036fc026d"
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
