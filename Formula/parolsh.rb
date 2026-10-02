class Parolsh < Formula
  desc "Speak to your terminal: a natural-language-first shell for ACP agents"
  homepage "https://opensource.byjg.com/docs/ai/parolsh"
  url "https://github.com/byjg/parolsh/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "dc9d70b97e664038ae65c52816b86a00217084430e6834d53c4f21a51b2640c8"
  license "MIT"
  head "https://github.com/byjg/parolsh.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    pkgshare.install "config.sample.toml"
  end

  def caveats
    <<~EOS
      A sample configuration with every agent is in:
        #{opt_pkgshare}/config.sample.toml
      Copy it to ~/.config/parolsh/config.toml and uncomment what you use.
    EOS
  end

  test do
    assert_match "parolsh #{version}", shell_output("#{bin}/parolsh --version")
    assert_equal "hello\n", shell_output("#{bin}/parolsh -c 'echo hello'")
  end
end
