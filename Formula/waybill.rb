class Waybill < Formula
  desc "Browse and download container image manifests"
  homepage "https://github.com/gucchisk/waybill"
  url "https://github.com/gucchisk/waybill/releases/download/v0.1.0/waybill-0.1.0.tar.gz"
  sha256 "3d4d5f05c45ba8bf3038218cf511fdcb33cb4b89770485818c93291cb64a7a87"

  bottle do
    root_url "https://github.com/gucchisk/homebrew-tap/releases/download/waybill-0.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "cefd2c2f5fc08e211cbe034c1550803b16a20046c987525ae253b7e759137093"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e3f1e2281dd7dc6aa2c4b561e7007e330abd320e106622e974382b262defcbd0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "11b4645324eb25d2b5c58fe2f37c18d696886147739cb074c563b8b083dbece3"
    sha256 cellar: :any,                 x86_64_linux:  "383695559d9690e37461ba054f9073e1bd8bb3031a07c1be5a0f1141146f6bc1"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/waybill"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/waybill --version")
  end
end
