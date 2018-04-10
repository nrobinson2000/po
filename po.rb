#                                            __      __  __
#                                           /  |    /  |/  |
#     ______    ______           __    __  _██ |_   ██/ ██ |
#    /      \  /      \  ______ /  |  /  |/ ██   |  /  |██ |
#   /██████  |/██████  |/      |██ |  ██ |██████/   ██ |██ |
#   ██ |  ██ |██ |  ██ |██████/ ██ |  ██ |  ██ | __ ██ |██ |
#   ██ |__██ |██ \__██ |        ██ \__██ |  ██ |/  |██ |██ |
#   ██    ██/ ██    ██/         ██    ██/   ██  ██/ ██ |██ |
#   ███████/   ██████/           ██████/     ████/  ██/ ██/
#   ██ |
#   ██ |
#   ██/                  https://po-util.com
#

#  po-util - The Ultimate Local Particle Experience for Linux and macOS
# Copyright (C) 2017  Nathan Robinson

class Newpo < Formula
  desc "Particle Offline Utility: The Ultimate Local Particle Experience"
  homepage 'https://po-util.com'
  head 'https://github.com/nrobinson2000/homebrew-NewPo', :using => :git
  url 'https://github.com/nrobinson2000/po/archive/0.1.7.tar.gz'
  sha256 'a1448fe51c1cf59ca7e18dc11b4db4788d02b0ec49d7a0d802d7e33d0091c7e2'

  def install
    bin.install 'bin/po'
    share.install 'share/po-common'
    share.install 'share/po-mac'
    man1.install 'man/po.1'
    bash_completion.install "completion/po"
  end

  def caveats; <<~EOS

  In order to complete the installation of po-util,
  you must run 'po install'.

  For Raspberry Pi support you must have docker installed.
  EOS
  end
end
