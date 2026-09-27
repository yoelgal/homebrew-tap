cask "openlookaway" do
  version :latest
  sha256 :no_check

  url "https://github.com/yoelgal/openlookaway/releases/latest/download/OpenLookAway.zip"
  name "OpenLookAway"
  desc "Free, open-source break reminder for your Mac"
  homepage "https://lookaway.yoelgal.com"

  depends_on macos: ">= :sonoma"

  app "OpenLookAway.app"

  # Not notarized (no paid Apple Developer account), so drop the quarantine flag.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/OpenLookAway.app"]
  end

  uninstall quit: "com.yoelgal.openlookaway"

  zap trash: "~/Library/Preferences/com.yoelgal.openlookaway.plist"
end
