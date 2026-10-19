class ClementineCli < Formula
  desc "Offline file converter (Clémentine's engine) for the command-line"
  homepage "https://github.com/diiad/clementine-mac"
  url "https://github.com/diiad/clementine-mac/releases/download/v0.1.0/clementine-cli-macos-arm64.tar.gz"
  version "0.1.0"
  sha256 "732988c662a73305f6947a16c2c6f9d165752a26e6f6cda8f8ec543dd3b631dd"
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
