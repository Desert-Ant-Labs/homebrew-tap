cask "desert-ant-flow" do
  version "0.0.2"
  sha256 "bcaffbd5f5c27a54dec1db3478c4e548fe98377276e29c23040387b6fa8723f3"

  url "https://github.com/Desert-Ant-Labs/demo-flow/releases/download/v#{version}/Desert-Ant-Flow-#{version}.dmg"
  name "Desert Ant Flow"
  desc "Build flows out of on-device models"
  homepage "https://github.com/Desert-Ant-Labs/demo-flow"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Desert Ant Flow.app"

  # The model cache under ~/Library/Caches/desert-ant-models is shared with
  # every Desert Ant app, so uninstalling this one does not remove it.
  zap trash: [
    "~/Library/Application Support/Flow",
    "~/Library/Caches/com.desertant.flow",
    "~/Library/HTTPStorages/com.desertant.flow",
    "~/Library/Preferences/com.desertant.flow.plist",
    "~/Library/Saved Application State/com.desertant.flow.savedState",
  ]
end
