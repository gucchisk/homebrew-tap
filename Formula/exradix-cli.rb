class ExradixCli < Formula
  desc "Is CLI for exradix"
  homepage "https://github.com/gucchisk/exradix-cli"
  url "https://github.com/gucchisk/exradix-cli.git", branch: "main"
  version "0.1.0"

  depends_on "cmake" => :build
  
  def install
    cd buildpath do
      system "cmake . && make"
      bin.install "exradix-cli" => "exradix-cli"
    end
  end
end
