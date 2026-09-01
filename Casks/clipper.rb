cask "clipper" do
  version "1.0.2"
  sha256 "090f38487330bfebfdad8cbf0a6440623d30bf5cf9794ff5c534efd5d959f7e4"

  url "https://github.com/Desert-Ant-Labs/demo-clipper/releases/download/v#{version}/Clipper-#{version}.dmg",
      verified: "github.com/Desert-Ant-Labs/demo-clipper/"
  name "Clipper"
  desc "Generates short clips from a video podcast or meeting recording, on device"
  homepage "https://github.com/Desert-Ant-Labs/demo-clipper"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Clipper.app"

  # The model cache under ~/Library/Caches/desert-ant-models is shared with
  # every Desert Ant app, so uninstalling this one does not remove it.
  zap trash: "~/Library/Application Support/Clipper"
end
