VERSION="0.3.3"

class Anaguma < Formula
  desc "anaguma is CLI for badagerDB"
  url "https://github.com/gucchisk/anaguma.git", :tag => "v#{VERSION}"
  version VERSION

  depends_on "go" => :build

  def install
    cd buildpath do 
      system "make"
      bin.install "bin/anaguma" => "anaguma"
    end
  end
end
