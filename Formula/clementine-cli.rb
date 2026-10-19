class ClementineCli < Formula
  desc "Offline file converter (Clémentine's engine) for the command-line"
  homepage "https://github.com/diiad/clementine"
  url "https://github.com/diiad/clementine/releases/download/v0.2.1/clementine-cli-macos-arm64.tar.gz"
  sha256 "92a17cd631181d824fc3aaf4b7426b353b35d488678f43bc19e12b91cd85fc9a"
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
