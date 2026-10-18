class Zert < Formula
  desc "Customer CLI for the zert sandbox service"
  homepage "https://github.com/Torgersrud/zert-cli"
  url "https://github.com/Torgersrud/zert-cli/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "b841dba489a8ec76dc6eddc7121d8f471124be5619b32912624b1034c85d98e3"
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
