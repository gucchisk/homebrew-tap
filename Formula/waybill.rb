class Waybill < Formula
  desc "Browse and download container image manifests"
  homepage "https://github.com/gucchisk/waybill"
  url "https://github.com/gucchisk/waybill/releases/download/v0.1.0/waybill-0.1.0.tar.gz"
  sha256 "3d4d5f05c45ba8bf3038218cf511fdcb33cb4b89770485818c93291cb64a7a87"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/waybill"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/waybill --version")
  end
end
