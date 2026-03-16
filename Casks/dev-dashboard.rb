cask "dev-dashboard" do
  version "1.0.0"

  if Hardware::CPU.arm?
    sha256 "12fe4aea8cc8d9e501eafe745a219758e8e1637522ab95a4fe9bc826ee37b402"
    url "https://github.com/VladMogwai/dev-dashboard/releases/download/v1.0.0/Dev.Dashboard-1.0.0-arm64-mac.zip"
  else
    sha256 "74e4b3b67136109803ea93b7b4ab1cf4a8c4bddfa89c242b326e2642565d2453"
    url "https://github.com/VladMogwai/dev-dashboard/releases/download/v1.0.0/Dev.Dashboard-1.0.0-mac.zip"
  end

  name "Dev Dashboard"
  desc "Developer Project Dashboard — like Docker Desktop for local dev projects"
  homepage "https://github.com/VladMogwai/dev-dashboard"

  app "Dev Dashboard.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Dev Dashboard.app"],
                   sudo: false
  end
end
