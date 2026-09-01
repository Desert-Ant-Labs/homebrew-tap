cask "clipper" do
  version "1.0.1"
  sha256 "8c8597bcc0c2609fcdc23ca13aeb452e307ac525be7cb24b28017d4fe48d6274"

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
