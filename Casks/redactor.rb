cask "redactor" do
  version "1.0.2"
  sha256 "948cd7396d445840c6352a63dfe8a6d91288966ceec9b367e5a408b97fc05119"

  url "https://github.com/Desert-Ant-Labs/demo-redactor/releases/download/v#{version}/Redactor-#{version}.dmg"
  name "Redactor"
  desc "Redacts personal data when you copy or paste, on device"
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
