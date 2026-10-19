class ClementineCli < Formula
  desc "Offline file converter (Clémentine's engine) for the command-line"
  homepage "https://github.com/diiad/clementine-mac"
  url "https://github.com/diiad/clementine-mac/releases/download/v0.2.0/clementine-cli-macos-arm64.tar.gz"
  sha256 "58b8423a96ea2fd79e0bc126f4f354ada78e974d7190e5193f0e90d765d9730b"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "clementine"
  end

  def caveats
    <<~EOS
      Audio and video conversions need ffmpeg:
        brew install ffmpeg
    EOS
  end

  test do
    assert_match "convert:jpg", shell_output("#{bin}/clementine list #{test_fixtures("test.png")}")
  end
end
