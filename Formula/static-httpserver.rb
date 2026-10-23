class StaticHttpserver < Formula
  desc "Minimal HTTP/HTTPS server for static files with SPA support"
  homepage "https://github.com/byjg/docker-static-httpserver"
  url "https://github.com/byjg/docker-static-httpserver/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "a76bf3a07ae12e62d55ac4a689f89f1f5610dc8997e1e0e61166976529cd95d4"
  license "MIT"
  head "https://github.com/byjg/docker-static-httpserver.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}")
  end

  test do
    assert_match "static-httpserver #{version}", shell_output("#{bin}/static-httpserver --version")
  end
end
