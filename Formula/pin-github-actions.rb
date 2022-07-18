class PinGitHubActions < Formula
    version "0.3.0"

    url "https://github.com/martinbonnin/pin-github-actions/releases/download/v#{version}/pin-github-actions.zip"
    name "pin-github-actions"
    desc "Pin your GitHub actions to their commit sha"
    homepage "https://github.com/martinbonnin/pin-github-actions"

    sha256 :no_check
  
    depends_on "openjdk"
  
    def install
      rm_f Dir["bin/*.bat"]
      libexec.install %w[bin lib]
      (bin/"pin-github-actions").write_env_script libexec/"bin/pin-github-actions",
        :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
    end
  
    test do
      output = shell_output("#{bin}/pin-github-actions --help")
      assert_includes output, "Usage: pin-github-actions"
    end
  end