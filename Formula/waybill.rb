class Waybill < Formula
  desc "Browse and download container image manifests"
  homepage "https://github.com/gucchisk/waybill"
  url "https://github.com/gucchisk/waybill/releases/download/v1.0.0/waybill-1.0.0.tar.gz"
  sha256 "16684503591e53f451380e88438733e91aaf98ce9bccd0d9281170e66f026460"

  bottle do
    root_url "https://github.com/gucchisk/homebrew-tap/releases/download/waybill-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "e4ba3b6c6390ee1bf0da82766cad1087ad3a58612508368e2ad42a1d8e40eaa2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d3db751105dea05f5f1d4b81836ab9e014d1704b120447d3d25f503ab4ce931f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e6f19034e5b72df57e057bc7f4772123d0f036e912eeaf31313f37a2de4a5130"
    sha256 cellar: :any,                 x86_64_linux:  "12b8821895a29f725eb1bd79ad255cb2467fe0a88fc62bbc43b638f0bfa2ee91"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/waybill"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/waybill --version")
  end
end
