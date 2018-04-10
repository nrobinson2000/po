#     ______    ______
#    /      \  /      \
#   /██████  |/██████  |  The Future of po-util:
#   ██ |  ██ |██ |  ██ |
#   ██ |__██ |██ \__██ |      Refactored,
#   ██    ██/ ██    ██/       Modular,
#   ███████/   ██████/        Cross-Compatible
#   ██ |
#   ██ |
#   ██/  https://po-util.com

# po - The Ultimate Local Particle Experience for Linux and macOS
# Copyright (C) 2018 Nathan D. Robinson

class Newpo < Formula
  desc "Particle Offline Utility: The Ultimate Local Particle Experience"
  homepage 'https://po-util.com'
  head 'https://github.com/nrobinson2000/homebrew-NewPo', :using => :git
  url 'https://github.com/nrobinson2000/po/archive/0.2.3.tar.gz'
  sha256 '50386c6e461b608b7e76b2bd4b6fa33cf8ead0b6f4122795cfae63db82aa8a3e'

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
