cask "quicknib" do
  version "1.0.3"
  sha256 "6015b752566de8fa1c2a7c0c2969b3f9312be4cbda3c66ccd5c45494f4d244b2"

  url "https://github.com/paramzvik/notepad-macos/releases/download/v#{version}/QuickNib-#{version}-arm64.dmg"
  name "QuickNib"
  desc "Lightweight notepad with syntax highlighting"
  homepage "https://github.com/paramzvik/notepad-macos"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "QuickNib.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/QuickNib.app"]
  end

  uninstall quit: "com.quicknib.app"

  zap trash: "~/Library/Application Support/quicknib"
end
