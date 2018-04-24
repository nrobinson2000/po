class Po < Formula
  desc "Particle Offline Utility: The Ultimate Local Particle Experience"
  homepage "https://po-util.com"
  url "https://github.com/nrobinson2000/po/archive/0.4.3.tar.gz"
  sha256 "e0f1a6bb8daf1b7b64c3c757565471432a97245f6916f7ed1f3260c25119d575"
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
