cask "clipper" do
  version "1.0.8"
  sha256 "7ecb0a9b397700bb104aca175471503b420b967f9c078d029446aeb5d74bcb4b"

  url "https://github.com/Desert-Ant-Labs/demo-clipper/releases/download/v#{version}/Clipper-#{version}.dmg"
  name "Clipper"
  desc "Generates short clips from a video podcast or meeting recording, on device"
  homepage "https://github.com/Desert-Ant-Labs/demo-clipper"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Clipper.app"

  # The model cache under ~/Library/Caches/desert-ant-models is shared with
  # every Desert Ant app, so uninstalling this one does not remove it.
  zap trash: [
    "~/Library/Application Support/Clipper",
    "~/Library/Caches/com.desertant.clipper",
    "~/Library/HTTPStorages/com.desertant.clipper",
  ]
end
