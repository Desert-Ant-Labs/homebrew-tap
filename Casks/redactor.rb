cask "redactor" do
  version "1.0.0"
  sha256 "69e7ef0055682439108bbd9c4950671e598bbe601b060fb938df0f38c0f0613e"

  url "https://github.com/Desert-Ant-Labs/demo-redactor/releases/download/v#{version}/Redactor-#{version}.dmg"
  name "Redactor"
  desc "Redacts personal data in what you copy, on device"
  homepage "https://github.com/Desert-Ant-Labs/demo-redactor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Redactor.app"

  # The model cache under ~/Library/Caches/desert-ant-models is shared with
  # every Desert Ant app, so uninstalling this one does not remove it.
  zap trash: "~/Library/Preferences/com.desertant.redactor.plist"
end
