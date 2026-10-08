class Waybill < Formula
  desc "Browse and download container image manifests"
  homepage "https://github.com/gucchisk/waybill"
  url "https://github.com/gucchisk/waybill/releases/download/v1.0.0/waybill-1.0.0.tar.gz"
  sha256 "16684503591e53f451380e88438733e91aaf98ce9bccd0d9281170e66f026460"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/waybill"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/waybill --version")
  end
end
