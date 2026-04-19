cask "hostsmanager" do
  version "1.7.2"
  sha256 "4a67e1c1180387106a16f48931dd46f09b4b96d1230e0e7812116e5640c3ce42"

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
