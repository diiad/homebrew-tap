cask "clementine" do
  version "0.2.1"
  sha256 "31e43d8c43c45cfc074289203f0198f4dfcfccbe89e3f4b6016c2a78251b9a58"

  url "https://github.com/diiad/clementine/releases/download/v#{version}/Clementine_#{version}_arm64.dmg"
  name "Clémentine"
  desc "Drag a file, hold a key, drop it on the wheel to convert it offline"
  homepage "https://github.com/diiad/clementine"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Clémentine.app"

  # Not notarized yet: clear the quarantine flag so Gatekeeper lets it open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Clémentine.app"]
  end

  uninstall quit: "io.github.diadieudoucoure.clementine"

  zap trash: [
    "~/Library/Application Support/io.github.diadieudoucoure.clementine",
    "~/Library/Caches/io.github.diadieudoucoure.clementine",
    "~/Library/LaunchAgents/Clémentine.plist",
    "~/Library/Preferences/io.github.diadieudoucoure.clementine.plist",
    "~/Library/WebKit/io.github.diadieudoucoure.clementine",
  ]

  caveats <<~EOS
    Audio and video conversions need ffmpeg:
      brew install ffmpeg
    Slides and higher-fidelity documents use LibreOffice:
      brew install --cask libreoffice
  EOS
end
