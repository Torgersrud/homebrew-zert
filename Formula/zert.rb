class Zert < Formula
  desc "Customer CLI for the zert sandbox service"
  homepage "https://github.com/Torgersrud/zert-cli"
  url "https://github.com/Torgersrud/zert-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "22f64e6652f99308cdaf4c56d39681ea6b36b4d7bb62a6c014bf66611b47bab9"
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
