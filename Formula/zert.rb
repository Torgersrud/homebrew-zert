class Zert < Formula
  desc "Customer CLI for the zert sandbox service"
  homepage "https://github.com/Torgersrud/zert-cli"
  url "https://github.com/Torgersrud/zert-cli/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "caaff741a2f3982b8a61416d6391c1a1d028e8dadfb1a3cef7044f3cf487f45a"
  license "MIT"

  livecheck do
    url "https://github.com/Torgersrud/zert-cli/tags"
    regex(/v(\d+(?:\.\d+)+)/i)
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zert --version")
  end
end
