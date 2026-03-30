cask "hostsmanager" do
  version "1.1.0"
  sha256 "2e87116beca985ac71b09fde8b3e75bc558a3e7829956b0c7f373a2b688cf1a4"

  url "https://github.com/twannguyenba-hash/HostsManager/releases/download/v#{version}/HostsManager-v#{version}.zip"
  name "HostsManager"
  desc "Quản lý file /etc/hosts trên macOS"
  homepage "https://github.com/twannguyenba-hash/HostsManager"

  depends_on macos: ">= :ventura"

  app "HostsManager.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/HostsManager.app"]
  end

  zap trash: [
    "~/Library/Caches/com.hostsmanager.app",
    "~/Library/Preferences/com.hostsmanager.app.plist",
    "~/Library/Saved Application State/com.hostsmanager.app.savedState",
  ]
end
