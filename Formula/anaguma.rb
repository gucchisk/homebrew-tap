VERSION="0.3.4".freeze

class Anaguma < Formula
  desc "Is CLI for badagerDB"
  homepage "https://github.com/gucchisk/anaguma"
  url "https://github.com/gucchisk/anaguma.git", tag: "v#{VERSION}"
  revision 1

  depends_on "go" => :build

  def install
    cd buildpath do
      system "make"
      bin.install "bin/anaguma" => "anaguma"
    end
  end
end
