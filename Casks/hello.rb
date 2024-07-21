# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "hello" do
  # version "1.0.1"
  # sha256 "a0c884da41a6b5eb81e5a2027d3b0f1f163949809aa265bc3f58be3c80f940d9"
  # version "1.0.2"
  # sha256 "4b49a1a9cdec23c4db3a452d6fa6ac1eb897cd212c6a888b68d7af7dc55a97bc"
  version "1.0.3"
  sha256 "a0c884da41a6b5eb81e5a2027d3b0f1f163949809aa265bc3f58be3c80f940d9"

  url "https://github.com/gucchisk/hello/releases/download/v#{version}/hello"
  name "hello"
  desc ""
  homepage ""

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url "https://github.com/gucchisk/hello/tags"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :page_match
  end

  postflight do
    set_permissions "~/hello", "0755"
    system('xattr -d com.apple.quarantine ~/hello')
  end

  depends_on macos: ">= :big_sur"
  # binary "hello-1.0.0/hello.sh"
  artifact "hello", target: "~/hello"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: ""
end
