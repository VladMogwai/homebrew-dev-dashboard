cask "dev-dashboard" do
  version "1.0.3"

  if Hardware::CPU.arm?
    sha256 "3dc57f1c440e0689fa7140e41528b4ace1a9a86980df18409bc5e4b73024175d"
    url "https://github.com/VladMogwai/dev-dashboard/releases/download/v1.0.3/Dev.Dashboard-1.0.3-arm64-mac.zip"
  else
    sha256 "a11d510196ccdabf3f73b162d408cd7283c8e0f06d13ab26c5ed263c9a2f358f"
    url "https://github.com/VladMogwai/dev-dashboard/releases/download/v1.0.3/Dev.Dashboard-1.0.3-mac.zip"
  end

  name "Dev Dashboard"
  desc "Developer Project Dashboard — like Docker Desktop for local dev projects"
  homepage "https://github.com/VladMogwai/dev-dashboard"

  app "Dev Dashboard.app"

  uninstall quit: "com.devdashboard.app",
            delete: "/Applications/Dev Dashboard.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Dev Dashboard.app"],
                   sudo: false
  end
end
