class PinGithubActions < Formula
    version "0.3.0"

    url "https://github.com/martinbonnin/pin-github-actions/releases/download/v#{version}/pin-github-actions.zip"
    desc "Pin your GitHub actions to their commit sha"
    homepage "https://github.com/martinbonnin/pin-github-actions"

    sha256 "7ef83ef172c1c3c87c0558c68ce367325e5e3a253dcb42c79adff5192ccc4113"
  
    depends_on "openjdk"
  
    def install
      libexec.install %w[bin lib]
      (bin/"pin-github-actions").write_env_script libexec/"bin/pin-github-actions",
        :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
    end
  
    test do
      output = shell_output("#{bin}/pin-github-actions --help")
      assert_includes output, "Usage: pin-github-actions"
    end
  end