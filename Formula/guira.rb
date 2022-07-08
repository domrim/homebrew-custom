class Guira < Formula
  desc "RA-Oberfläche für den Teilnehmerservice der DFN-PKI"
  homepage "https://blog.pki.dfn.de/tag/guira-releases/"
  url "https://pki.pca.dfn.de/guira/guira-3.7.1.zip"
  #  version "3.7.1"
  sha256 "7bafedb84c81e4f03ca21851cc7654f0f4a370cb088a64caf4ce040aac53f31b"
  license ""

  depends_on "openjdk"

  def install
    prefix.install "guira.jar"
    libexec.install Dir["lib/*"]
    bin.install "guira-macosx.command" => "guira"

    inreplace bin/"guira" do |s|
      s.gsub! "./lib", libexec
      s.sub! /^dir=.*$/, "dir=#{opt_prefix}"
    end
  end

  test do
    system "true"
  end
end
