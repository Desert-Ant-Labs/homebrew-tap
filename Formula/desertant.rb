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
      sha256 "413c62f7dfda44ae57146428dd18f17743015b54bd33c009054028b58e2fe8a1"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/desertant-linux-arm64.tar.gz"
      sha256 "72bd9c0d498602f65bf1f420caa4ee5904e0bfbe153fbe88179d49171e72f6a8"
    end
    on_intel do
      url "#{base}/desertant-linux-x86_64.tar.gz"
      sha256 "59ff2bf186a1deeabcb77d95d2b9da283a2b65f6cf682220924a2f46f4d07ef4"
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
