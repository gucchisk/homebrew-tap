class ExradixCli < Formula
  desc "Is CLI for exradix"
  homepage "https://github.com/gucchisk/exradix-cli"
  url "https://github.com/gucchisk/exradix-cli.git", branch: "main"
  version "0.1.0"

  resource "exradix" do
    url "ssh://git@github.com/gucchisk/exradix.git", branch: "main"
  end

  depends_on "cmake" => :build
  
  def install
    cd buildpath do
      (buildpath/"exradix").install resource("exradix")
      args = std_cmake_args + %W[
        # 3. FetchContent がネットワークアクセスしないよう完全遮断
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON
        # 4. FetchContent_Declare("exradix" ...) の取得先をローカルに差し替え
        -DFETCHCONTENT_SOURCE_DIR_EXRADIX=#{buildpath}/exradix
      ]
      system "cmake",  ".", *args
      system "make"
      bin.install "exradix-cli" => "exradix-cli"
    end
  end
end
