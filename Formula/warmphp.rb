class Warmphp < Formula
  desc "Turns your PHP CLI into a web application server, with persistent workers"
  homepage "https://opensource.byjg.com/docs/devops/warmphp"
  url "https://github.com/byjg/warmphp/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "77fb99456c090ae6a0417c4b30f2d8b2e8a3ceba84d286a8a798b006fe87669e"
  license "MIT"
  head "https://github.com/byjg/warmphp.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.buildVersion=#{version}")
  end

  test do
    assert_match "warmphp #{version}", shell_output("#{bin}/warmphp -version")
  end
end
