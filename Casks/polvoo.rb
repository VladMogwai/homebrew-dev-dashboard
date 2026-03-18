cask "polvoo" do
  version "1.0.10"

  if Hardware::CPU.arm?
    sha256 "95a6ffb1df1af7749470ae89ff678104135906fa588a3bcc491be8deae4da0da"
    url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.10/Polvoo-1.0.10-arm64-mac.zip"
  else
    sha256 "bd5a96780efcd380cdb9918eeb29ccaeca1b10d23c70837c4638235e375dd850"
    url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.10/Polvoo-1.0.10-mac.zip"
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
