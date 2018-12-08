class Po < Formula
  desc "Particle Offline Utility: The Ultimate Local Particle Experience"
  homepage "https://po-util.com"
  url "https://github.com/nrobinson2000/po/archive/0.6.0.tar.gz"
  sha256 "7bd0205ffd952f0e94eb6a1774a9e8a6c3bc21554828fc50a0c4042fcad5b77d"
  head "https://github.com/nrobinson2000/po", :using => :git

  def install
    bin.install "bin/po"
    share.install "share/po-common"
    share.install "share/po-mac"
    man1.install "man/po.1"
    bash_completion.install "completion/po"
  end

  def caveats; <<~EOS
    In order to complete the installation of po-util,
    you must run "po install".

    For Raspberry Pi support you must have docker installed.
    EOS
  end

  test do
    system "#{bin}/po", "config", "release/v0.6.3", "duo", "false"
    system "#{bin}/po", "info"
  end
end
