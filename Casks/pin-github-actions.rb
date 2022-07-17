cask "pin-github-actions" do
    arch = Hardware::CPU.intel? ? "x64" : "arm64"
  
    version "0.2.0"
  
    sha256 :no_check
  
    url "https://github.com/martinbonnin/pin-github-actions/releases/download/v#{version}/pin-github-actions-#{arch}.zip"
    name "pin-github-actions"
    desc "Pin your GitHub actions to their commit sha"
    homepage "https://github.com/martinbonnin/pin-github-actions"
  
    binary "pin-github-actions/pin-github-actions"
  
  end