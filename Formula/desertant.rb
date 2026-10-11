# Homebrew formula for desertant. This is the template: the release workflow fills in
# the version and checksums (Tools/render-formula), and Tools/publish-formula puts
# the result in Desert-Ant-Labs/homebrew-tap.
class Desertant < Formula
  desc "Runs Desert Ant Labs on-device models from the terminal"
  homepage "https://github.com/Desert-Ant-Labs/desert-ant-cli"
  version "0.2.2"
  license "MIT"

  base = "https://github.com/Desert-Ant-Labs/desert-ant-cli/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/desertant-darwin-arm64.tar.gz"
      sha256 "48744c8e09fd6f104e66a6ed44acb04df3a610ccc65a88bed03cd0da995fe527"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/desertant-linux-arm64.tar.gz"
      sha256 "a6bd06fde69c517f51b9388fa10cbdfff54b70eefa6d3ec27a9507ef3d521814"
    end
    on_intel do
      url "#{base}/desertant-linux-x86_64.tar.gz"
      sha256 "952d5264894173c0330f27e6797bdc892c5b2a48f71ed7dbd80d68d13db3c2ed"
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
