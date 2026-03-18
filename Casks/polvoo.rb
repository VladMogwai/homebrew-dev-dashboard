cask "polvoo" do
  version "1.0.11"

  if Hardware::CPU.arm?
    sha256 "f88a77f484c38ab33dd354101c9bb85c7a068a3a82a02a7dc7814b3c41cab049"
    url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.11/Polvoo-1.0.11-arm64-mac.zip"
  else
    sha256 "a1f7d8bb3fbe31c59acb8938ac93e469fe71aaa2ebbca43b4dfd96c43cf8ab42"
    url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.11/Polvoo-1.0.11-mac.zip"
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
