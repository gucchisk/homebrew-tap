VERSION="0.3.5".freeze

class Anaguma < Formula
  desc "Is CLI for badagerDB"
  homepage "https://github.com/gucchisk/anaguma"
  url "https://github.com/gucchisk/anaguma.git", tag: "v#{VERSION}"

  bottle do
    root_url "https://github.com/gucchisk/homebrew-tap/releases/download/anaguma-0.3.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ad3705fe5541f53d08c44bd8173317c959054c979cf65598f8f294bb53966ea7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "60c7d9ee5b138d8dbc307af015469c6f1a2387d141b34c40f825b4a056f137c6"
    sha256 cellar: :any_skip_relocation, ventura:       "2a290a98b449f6ff5777eeff38e0ceb225be0b98dd15c61c032af05c3088aa1e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5ad119463442904685ceb17fa4ab64c916f7174ff21c8266bf2c415fd4d62bd1"
  end

  depends_on "go" => :build

  def install
    cd buildpath do
      system "make"
      bin.install "bin/anaguma" => "anaguma"
    end
  end
end
