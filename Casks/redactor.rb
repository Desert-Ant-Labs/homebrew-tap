cask "redactor" do
  version "1.0.4"
  sha256 "326b70d1c185cdda1779a0619f3de327c102c57de216ed3b8727ceda08c36c49"

  url "https://github.com/Desert-Ant-Labs/demo-redactor/releases/download/v#{version}/Redactor-#{version}.dmg"
  name "Redactor"
  desc "Redacts personal data when you copy or paste, on device"
  homepage "https://github.com/Desert-Ant-Labs/demo-redactor"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Redactor.app"

  # The model cache under ~/Library/Caches/desert-ant-models is shared with
  # every Desert Ant app, so uninstalling this one does not remove it.
  zap trash: [
    "~/Library/Caches/com.desertant.redactor",
    "~/Library/HTTPStorages/com.desertant.redactor",
    "~/Library/Preferences/com.desertant.redactor.plist",
  ]
end
