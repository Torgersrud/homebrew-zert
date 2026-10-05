class Zert < Formula
  desc "Customer CLI for the zert sandbox service"
  homepage "https://github.com/Torgersrud/zert-cli"
  url "https://github.com/Torgersrud/zert-cli/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "3bf9a82a66c68516ebca30a9a9fe6f4e94584611900688e932ad15f67bba4c80"
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
