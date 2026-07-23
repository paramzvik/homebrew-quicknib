cask "quicknib" do
  version "1.0.2"
  sha256 "12991d1237efd2c34ba9d6c1f83f329639f1c070450f19067b609243ba5ca531"

  url "https://github.com/paramzvik/notepad-macos/releases/download/v#{version}/QuickNib-#{version}-arm64.dmg"
  name "QuickNib"
  desc "Lightweight notepad with syntax highlighting"
  homepage "https://github.com/paramzvik/notepad-macos"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "QuickNib.app"

  postflight do
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/QuickNib.app"]
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/QuickNib.app"]
  end

  uninstall quit: "com.quicknib.app"

  zap trash: "~/Library/Application Support/quicknib"
end
