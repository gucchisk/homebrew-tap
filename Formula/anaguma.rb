VERSION="0.3.5".freeze

class Anaguma < Formula
  desc "Is CLI for badagerDB"
  homepage "https://github.com/gucchisk/anaguma"
  url "https://github.com/gucchisk/anaguma.git", tag: "v#{VERSION}"

  bottle do
    root_url "https://github.com/gucchisk/homebrew-tap/releases/download/anaguma-0.3.4"
    sha256 cellar: :any_skip_relocation, big_sur:      "06ff9a4a5ea77293723cca0d66cf998d8b29720ff1ebe737c0229f788a267130"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ee40000b12e667ca6d182de7f214add9c21bc04cef5835eb45e0c3d6c83d2b0a"
  end

  depends_on "go" => :build

  def install
    cd buildpath do
      system "make"
      bin.install "bin/anaguma" => "anaguma"
    end
  end
end
