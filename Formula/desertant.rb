# Homebrew formula for desertant. This is the template: the release workflow fills in
# the version and checksums (Tools/render-formula), and Tools/publish-formula puts
# the result in Desert-Ant-Labs/homebrew-tap.
class Desertant < Formula
  desc "Runs Desert Ant Labs on-device models from the terminal"
  homepage "https://github.com/Desert-Ant-Labs/desert-ant-cli"
  version "0.4.0"
  license "MIT"

  base = "https://github.com/Desert-Ant-Labs/desert-ant-cli/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/desertant-darwin-arm64.tar.gz"
      sha256 "e904b55eba24d4d46ea627ffe586dd4c43c0cb1a94de82d35c1b405444d9f79a"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/desertant-linux-arm64.tar.gz"
      sha256 "e2c0af406454c2a58773a3aeb0813d97d270b31cfae0d3a1a6a313951672e5fc"
    end
    on_intel do
      url "#{base}/desertant-linux-x86_64.tar.gz"
      sha256 "3a6301b84df92ef9213872b2c050a112023d0766ddfe0942dc9c5b931990850c"
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
