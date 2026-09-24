class Waybill < Formula
  desc "Browse and download container image manifests"
  homepage "https://github.com/gucchisk/waybill"
  url "https://github.com/gucchisk/waybill/releases/download/v0.2.0/waybill-0.2.0.tar.gz"
  sha256 "d618174edc8312001e8241afbb8d1b1437f617fed17581383d9cef5e0983fc18"

  bottle do
    root_url "https://github.com/gucchisk/homebrew-tap/releases/download/waybill-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "821d291fbbbb8aa0a097cbc9c6afbb877881201053b1733c310afcd346fc7b87"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a3f2772ae35715938b8f727728af6508969b69d2e811995c82db57bb0e63a03d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0c1d489b265b7868a356c53f878040e2a73af38c9fe2d8b6e3bf5a471dd2bf3d"
    sha256 cellar: :any,                 x86_64_linux:  "2bcb53b972afe66133724f08ba89282ae39695788bb26e11e9719bc350992832"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/waybill"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/waybill --version")
  end
end
