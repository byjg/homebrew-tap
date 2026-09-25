class StaticHttpserver < Formula
  desc "Minimal HTTP/HTTPS server for static files with SPA support"
  homepage "https://github.com/byjg/docker-static-httpserver"
  url "https://github.com/byjg/docker-static-httpserver/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "b0f89b83a0c5152914b50680d2374652beba232eb219724921f2d4fb4a0a8c04"
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
