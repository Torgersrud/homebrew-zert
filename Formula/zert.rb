class Zert < Formula
  desc "Customer CLI for the zert sandbox service"
  homepage "https://github.com/Torgersrud/zert-cli"
  url "https://github.com/Torgersrud/zert-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "REPLACE_WITH_SHA256_OF_SOURCE_TARBALL"
  # TODO: add a LICENSE file to zert-cli and set the license here
  license "UNLICENSED"

  depends_on "go" => :build

  livecheck do
    url "https://github.com/Torgersrud/zert-cli/tags"
    regex(/v(\d+(?:\.\d+)+)/)
  end

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zert --version")
  end
end
