class PinGithubActions < Formula
    version "0.3.3"

    url "https://github.com/martinbonnin/pin-github-actions/releases/download/v#{version}/pin-github-actions.zip"
    desc "Pin your GitHub actions to their commit sha"
    homepage "https://github.com/martinbonnin/pin-github-actions"

    sha256 "e22d3396f66fdc94a0198ee5b9263cf141132cc28b68adee290bd03176fb41fd"
  
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
