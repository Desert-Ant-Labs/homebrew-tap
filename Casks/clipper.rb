cask "clipper" do
  version "1.0.6"
  sha256 "a02dc9c5c957ec4c955f3b48bf347d21e5b688191d3a0abf8e71204297732fb5"

  url "https://github.com/Desert-Ant-Labs/demo-clipper/releases/download/v#{version}/Clipper-#{version}.dmg"
  name "Clipper"
  desc "Generates short clips from a video podcast or meeting recording, on device"
  homepage "https://github.com/Desert-Ant-Labs/demo-clipper"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Clipper.app"

  # The model cache under ~/Library/Caches/desert-ant-models is shared with
  # every Desert Ant app, so uninstalling this one does not remove it.
  zap trash: "~/Library/Application Support/Clipper"
end
