cask "polvoo" do
  version "1.0.9"

  if Hardware::CPU.arm?
    sha256 "c6588a1166767d88c0ded511d6b42dd6de9c32098b917e291e947d2622bd12ba"
    url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.9/Polvoo-1.0.9-arm64-mac.zip"
  else
    sha256 "93278b55ec62d7ff3ddfdff8b3dee4857e0a3eec73010adb62cf96e3919881a8"
    url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.9/Polvoo-1.0.9-mac.zip"
  end

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
