cask "polvoo" do
  version "1.0.7"

  if Hardware::CPU.arm?
    sha256 "beb5f9396c5bd8edfb17ba4db0f2ea1de140a5e06766116f9126af7639affcff"
    url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.7/Polvoo-1.0.7-arm64-mac.zip"
  else
    sha256 "a983ebd04fd83665a456cb99b33d7173bf176a4d03f0e44c1504ae466d51095f"
    url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.7/Polvoo-1.0.7-mac.zip"
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
