class PinGithubActions < Formula
    version "0.3.1"

    url "https://github.com/martinbonnin/pin-github-actions/releases/download/v#{version}/pin-github-actions.zip"
    desc "Pin your GitHub actions to their commit sha"
    homepage "https://github.com/martinbonnin/pin-github-actions"

    sha256 "6bcaad5387eab22bcd6d7bf06c2d956bace0384bb3399b195f96de79b0df16d8"
  
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
