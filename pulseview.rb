require 'formula'

class Pulseview < Formula
  url 'http://sigrok.org/download/source/pulseview/pulseview-0.1.0.tar.gz'
  homepage 'http://sigrok.org/'
  head 'git://sigrok.org/pulseview',:using => Class.new(GitDownloadStrategy) { def support_depth?; false; end }
  sha1 '800450bdf65ce9c7559c2522a73b0a50e087bcc0'

  depends_on 'libsigrok' => :build
  depends_on 'libsigrokdecode'
  depends_on :python3
  depends_on 'libserialport'
  depends_on 'boost'
  depends_on 'qt'
  depends_on 'pkg-config' => :build
  depends_on 'cmake' => :build
  depends_on 'glib'
  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    system "cmake", ".", "-DENABLE_DECODE=y", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/pulseview", "-V"
  end
end
