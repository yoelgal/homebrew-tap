cask "notes-thing" do
  version :latest
  sha256 :no_check

  url "https://github.com/yoelgal/notes-thing/releases/latest/download/NotesThing.zip"
  name "Notes Thing"
  desc "Menu bar lecture recorder with timestamped live notes, transcribed on-device"
  homepage "https://notesthing.yoelgal.com"

  depends_on macos: :sonoma

  app "Notes Thing.app"

  # Not notarized (no paid Apple Developer account), so drop the quarantine flag.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Notes Thing.app"]
  end

  uninstall quit: "com.yoelgal.notesthing"
end
