class StaticHttpserver < Formula
  desc "Minimal HTTP/HTTPS server for static files with SPA support"
  homepage "https://github.com/byjg/docker-static-httpserver"
  url "https://github.com/byjg/docker-static-httpserver/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "02c26f0e3d9d80d5a1872a43600f7017db17d1cabaf863640c208f4210e6d78e"
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
