cask "polvoo" do
  version "1.0.5"

  sha256 "2cb8397261b6c0466cf1c43adb871836bbe922be1d29b10bbdbfe7d2d48b5055"
  url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.5/Polvoo-1.0.5-arm64-mac.zip"

  name "Polvoo"
  desc "Developer Project Dashboard — like Docker Desktop for local dev projects"
  homepage "https://github.com/VladMogwai/polvoo"

  app "Polvoo.app"

  uninstall quit: "com.polvoo.app",
            delete: "/Applications/Polvoo.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Polvoo.app"],
                   sudo: false
  end
end
